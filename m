Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RMKgz-0001Pm-9o
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 15:24:25 +0100
Received: by eyd9 with SMTP id 9so2044573eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=TjCrG2jXq1MyFDcwv6GG4SyuNjxkqesac20GMaZ3m+c=;
	b=xfBMZvEhdCcEQZHZB95ICq8CDVBTrd8Hj3ObhdjB+YFgcJZijvMk9BWDY9/iJtNNAb
	aSjmeYe/6cyBFkp6/EDM+DEQ+j0z7uNLodyDRoDgxEvJ8GqRxkJTsVdX9JkvCCvCH6Mc
	A7Y2mOGT0YiHo+71dEyutosnF1KuhfQXLpXnw=
Received: by 10.213.10.133 with SMTP id p5mr282955ebp.132.1320416295412;
	Fri, 04 Nov 2011 07:18:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm25636463eec.1.2011.11.04.07.18.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 07:18:14 -0700 (PDT)
Date: Fri, 4 Nov 2011 15:18:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111104141806.GU9949@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: libvpx causing gcc ICE when building for qemux86-64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2011 14:24:25 -0000
X-Groupsio-MsgNum: 35212
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IX4edXMD7HczJcpd"
Content-Disposition: inline

--IX4edXMD7HczJcpd
Content-Type: multipart/mixed; boundary="czRehjsqUdpaVUeF"
Content-Disposition: inline

--czRehjsqUdpaVUeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, with latest gcc-4.6 from meta-oe I get this ICE:

OE @ ~/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9.5-r0.0/libvpx-v0.9.5 $ =
x86_64-oe-linux-gcc    -m64 --sysroot=3D/OE/shr-core/tmp/sysroots/qemux86-6=
4 -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O3 -Wall -Wdeclaration=
-after-statement -Wdisabled-optimization -Wpointer-arith -Wtype-limits -Wca=
st-qual -Wno-unused -I. -I"/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9=
=2E5-r0.0/libvpx-v0.9.5" -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9=
=2E5-r0.0/libvpx-v0.9.5/vp8 -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-=
0.9.5-r0.0/libvpx-v0.9.5/vp8 -c -o md5_utils.c.o md5_utils.c
md5_utils.c: In function 'byteSwap':
md5_utils.c:30:1: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

Line 30 is=20
byteSwap(UWORD32 *buf, unsigned words)

md5_utils.c and preprocessed md5_utils.c.E attached

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--czRehjsqUdpaVUeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="md5_utils.c.E"

# 1 "md5_utils.c"
# 1 "/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9.5-r0.0/libvpx-v0.9.5//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "md5_utils.c"
# 23 "md5_utils.c"
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 1 3 4
# 26 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 1 3 4
# 324 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/predefs.h" 1 3 4
# 325 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 2 3 4
# 357 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/cdefs.h" 1 3 4
# 353 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/cdefs.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/wordsize.h" 1 3 4
# 354 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/cdefs.h" 2 3 4
# 358 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 2 3 4
# 389 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/gnu/stubs.h" 1 3 4



# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/wordsize.h" 1 3 4
# 5 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/gnu/stubs.h" 2 3 4




# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/gnu/stubs-64.h" 1 3 4
# 10 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/gnu/stubs.h" 2 3 4
# 390 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/features.h" 2 3 4
# 27 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4



# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/types.h" 1 3 4
# 28 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/wordsize.h" 1 3 4
# 29 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 131 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/typesizes.h" 1 3 4
# 132 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 31 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 61 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 99 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 133 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 1 3 4
# 58 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 74 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 3 4


typedef __time_t time_t;



# 92 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 104 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 134 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4
# 147 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.2/include/stddef.h" 1 3 4
# 212 "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 148 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 195 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 217 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/endian.h" 1 3 4
# 37 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/endian.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/endian.h" 1 3 4
# 38 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/endian.h" 2 3 4
# 61 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/endian.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/byteswap.h" 1 3 4
# 28 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/byteswap.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/wordsize.h" 1 3 4
# 29 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/byteswap.h" 2 3 4
# 62 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/endian.h" 2 3 4
# 218 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4


# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 1 3 4
# 31 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/select.h" 1 3 4
# 23 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/select.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/wordsize.h" 1 3 4
# 24 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/select.h" 2 3 4
# 32 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 2 3 4


# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/sigset.h" 1 3 4
# 24 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 35 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 1 3 4
# 120 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
# 45 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 2 3 4

# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/time.h" 1 3 4
# 31 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 47 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 67 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 99 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 3 4

# 109 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 121 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);



# 221 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4


# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/sysmacros.h" 1 3 4
# 30 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/sysmacros.h" 3 4


__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__));


__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_major (unsigned long long int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}

__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_minor (unsigned long long int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}

__extension__ extern __inline unsigned long long int
__attribute__ ((__nothrow__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}


# 224 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 271 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 1 3 4
# 23 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/wordsize.h" 1 3 4
# 24 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 2 3 4
# 50 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;



typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 76 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    int __spins;
    __pthread_list_t __list;
# 101 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;
  } __data;
# 187 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 272 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/sys/types.h" 2 3 4



# 24 "md5_utils.c" 2

# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 1 3 4
# 29 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4





# 1 "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.2/include/stddef.h" 1 3 4
# 35 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 95 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 126 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));






# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/xlocale.h" 1 3 4
# 28 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 163 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 2 3 4


extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 210 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4

# 235 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 262 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 281 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4



extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 314 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 342 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));
# 397 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4


extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (__const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__));

# 427 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__))

                        __attribute__ ((__nonnull__ (2)));
# 445 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 489 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 517 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
# 536 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 559 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__));


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 634 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string.h" 1 3 4
# 635 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 2 3 4


# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 1 3 4
# 394 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern void *__rawmemchr (const void *__s, int __c);
# 969 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern __inline size_t __strcspn_c1 (__const char *__s, int __reject);
extern __inline size_t
__strcspn_c1 (__const char *__s, int __reject)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c2 (__const char *__s, int __reject1,
         int __reject2);
extern __inline size_t
__strcspn_c2 (__const char *__s, int __reject1, int __reject2)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject1
  && __s[__result] != __reject2)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c3 (__const char *__s, int __reject1,
         int __reject2, int __reject3);
extern __inline size_t
__strcspn_c3 (__const char *__s, int __reject1, int __reject2,
       int __reject3)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject1
  && __s[__result] != __reject2 && __s[__result] != __reject3)
    ++__result;
  return __result;
}
# 1045 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern __inline size_t __strspn_c1 (__const char *__s, int __accept);
extern __inline size_t
__strspn_c1 (__const char *__s, int __accept)
{
  register size_t __result = 0;

  while (__s[__result] == __accept)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c2 (__const char *__s, int __accept1,
        int __accept2);
extern __inline size_t
__strspn_c2 (__const char *__s, int __accept1, int __accept2)
{
  register size_t __result = 0;

  while (__s[__result] == __accept1 || __s[__result] == __accept2)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c3 (__const char *__s, int __accept1,
        int __accept2, int __accept3);
extern __inline size_t
__strspn_c3 (__const char *__s, int __accept1, int __accept2, int __accept3)
{
  register size_t __result = 0;

  while (__s[__result] == __accept1 || __s[__result] == __accept2
  || __s[__result] == __accept3)
    ++__result;
  return __result;
}
# 1121 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern __inline char *__strpbrk_c2 (__const char *__s, int __accept1,
         int __accept2);
extern __inline char *
__strpbrk_c2 (__const char *__s, int __accept1, int __accept2)
{

  while (*__s != '\0' && *__s != __accept1 && *__s != __accept2)
    ++__s;
  return *__s == '\0' ? ((void *)0) : (char *) (size_t) __s;
}

extern __inline char *__strpbrk_c3 (__const char *__s, int __accept1,
         int __accept2, int __accept3);
extern __inline char *
__strpbrk_c3 (__const char *__s, int __accept1, int __accept2,
       int __accept3)
{

  while (*__s != '\0' && *__s != __accept1 && *__s != __accept2
  && *__s != __accept3)
    ++__s;
  return *__s == '\0' ? ((void *)0) : (char *) (size_t) __s;
}
# 1172 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern __inline char *__strtok_r_1c (char *__s, char __sep, char **__nextp);
extern __inline char *
__strtok_r_1c (char *__s, char __sep, char **__nextp)
{
  char *__result;
  if (__s == ((void *)0))
    __s = *__nextp;
  while (*__s == __sep)
    ++__s;
  __result = ((void *)0);
  if (*__s != '\0')
    {
      __result = __s++;
      while (*__s != '\0')
 if (*__s++ == __sep)
   {
     __s[-1] = '\0';
     break;
   }
    }
  *__nextp = __s;
  return __result;
}
# 1204 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern char *__strsep_g (char **__stringp, __const char *__delim);
# 1222 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern __inline char *__strsep_1c (char **__s, char __reject);
extern __inline char *
__strsep_1c (char **__s, char __reject)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0) && (*__s = (__extension__ (__builtin_constant_p (__reject) && !__builtin_constant_p (__retval) && (__reject) == '\0' ? (char *) __rawmemchr (__retval, __reject) : __builtin_strchr (__retval, __reject)))) != ((void *)0))
    *(*__s)++ = '\0';
  return __retval;
}

extern __inline char *__strsep_2c (char **__s, char __reject1, char __reject2);
extern __inline char *
__strsep_2c (char **__s, char __reject1, char __reject2)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      register char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}

extern __inline char *__strsep_3c (char **__s, char __reject1, char __reject2,
       char __reject3);
extern __inline char *
__strsep_3c (char **__s, char __reject1, char __reject2, char __reject3)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      register char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2 || *__cp == __reject3)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}
# 1298 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/stdlib.h" 1 3 4
# 33 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/stdlib.h" 3 4
# 1 "/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.2/include/stddef.h" 1 3 4
# 34 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/stdlib.h" 2 3 4


# 469 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/stdlib.h" 3 4


extern void *malloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;

# 964 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/stdlib.h" 3 4

# 1299 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 2 3 4




extern char *__strdup (__const char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));
# 1322 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/bits/string2.h" 3 4
extern char *__strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));
# 638 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 2 3 4
# 646 "/OE/shr-core/tmp/sysroots/qemux86-64/usr/include/string.h" 3 4

# 26 "md5_utils.c" 2

# 1 "md5_utils.h" 1
# 29 "md5_utils.h"
typedef struct MD5Context MD5Context;
struct MD5Context
{
    unsigned int buf[4];
    unsigned int bytes[2];
    unsigned int in[16];
};

void MD5Init(struct MD5Context *context);
void MD5Update(struct MD5Context *context, unsigned char const *buf, unsigned len);
void MD5Final(unsigned char digest[16], struct MD5Context *context);
void MD5Transform(unsigned int buf[4], unsigned int const in[16]);
# 28 "md5_utils.c" 2

void
byteSwap(unsigned int *buf, unsigned words)
{
    unsigned char *p;


    int i = 1;

    if (*(char *)&i == 1)
        return;

    p = (unsigned char *)buf;

    do
    {
        *buf++ = (unsigned int)((unsigned)p[3] << 8 | p[2]) << 16 |
                 ((unsigned)p[1] << 8 | p[0]);
        p += 4;
    }
    while (--words);
}





void
MD5Init(struct MD5Context *ctx)
{
    ctx->buf[0] = 0x67452301;
    ctx->buf[1] = 0xefcdab89;
    ctx->buf[2] = 0x98badcfe;
    ctx->buf[3] = 0x10325476;

    ctx->bytes[0] = 0;
    ctx->bytes[1] = 0;
}





void
MD5Update(struct MD5Context *ctx, unsigned char const *buf, unsigned len)
{
    unsigned int t;



    t = ctx->bytes[0];

    if ((ctx->bytes[0] = t + len) < t)
        ctx->bytes[1]++;

    t = 64 - (t & 0x3f);

    if (t > len)
    {
        memcpy((unsigned char *)ctx->in + 64 - t, buf, len);
        return;
    }


    memcpy((unsigned char *)ctx->in + 64 - t, buf, t);
    byteSwap(ctx->in, 16);
    MD5Transform(ctx->buf, ctx->in);
    buf += t;
    len -= t;


    while (len >= 64)
    {
        memcpy(ctx->in, buf, 64);
        byteSwap(ctx->in, 16);
        MD5Transform(ctx->buf, ctx->in);
        buf += 64;
        len -= 64;
    }


    memcpy(ctx->in, buf, len);
}





void
MD5Final(unsigned char digest[16], struct MD5Context *ctx)
{
    int count = ctx->bytes[0] & 0x3f;
    unsigned char *p = (unsigned char *)ctx->in + count;


    *p++ = 0x80;


    count = 56 - 1 - count;

    if (count < 0)
    {
        memset(p, 0, count + 8);
        byteSwap(ctx->in, 16);
        MD5Transform(ctx->buf, ctx->in);
        p = (unsigned char *)ctx->in;
        count = 56;
    }

    memset(p, 0, count);
    byteSwap(ctx->in, 14);


    ctx->in[14] = ctx->bytes[0] << 3;
    ctx->in[15] = ctx->bytes[1] << 3 | ctx->bytes[0] >> 29;
    MD5Transform(ctx->buf, ctx->in);

    byteSwap(ctx->buf, 4);
    memcpy(digest, ctx->buf, 16);
    memset(ctx, 0, sizeof(*ctx));
}
# 169 "md5_utils.c"
void
MD5Transform(unsigned int buf[4], unsigned int const in[16])
{
    register unsigned int a, b, c, d;

    a = buf[0];
    b = buf[1];
    c = buf[2];
    d = buf[3];

    (a += (d ^ (b & (c ^ d))) + in[0] + 0xd76aa478, a = (a<<7 | a>>(32-7)) + b);
    (d += (c ^ (a & (b ^ c))) + in[1] + 0xe8c7b756, d = (d<<12 | d>>(32-12)) + a);
    (c += (b ^ (d & (a ^ b))) + in[2] + 0x242070db, c = (c<<17 | c>>(32-17)) + d);
    (b += (a ^ (c & (d ^ a))) + in[3] + 0xc1bdceee, b = (b<<22 | b>>(32-22)) + c);
    (a += (d ^ (b & (c ^ d))) + in[4] + 0xf57c0faf, a = (a<<7 | a>>(32-7)) + b);
    (d += (c ^ (a & (b ^ c))) + in[5] + 0x4787c62a, d = (d<<12 | d>>(32-12)) + a);
    (c += (b ^ (d & (a ^ b))) + in[6] + 0xa8304613, c = (c<<17 | c>>(32-17)) + d);
    (b += (a ^ (c & (d ^ a))) + in[7] + 0xfd469501, b = (b<<22 | b>>(32-22)) + c);
    (a += (d ^ (b & (c ^ d))) + in[8] + 0x698098d8, a = (a<<7 | a>>(32-7)) + b);
    (d += (c ^ (a & (b ^ c))) + in[9] + 0x8b44f7af, d = (d<<12 | d>>(32-12)) + a);
    (c += (b ^ (d & (a ^ b))) + in[10] + 0xffff5bb1, c = (c<<17 | c>>(32-17)) + d);
    (b += (a ^ (c & (d ^ a))) + in[11] + 0x895cd7be, b = (b<<22 | b>>(32-22)) + c);
    (a += (d ^ (b & (c ^ d))) + in[12] + 0x6b901122, a = (a<<7 | a>>(32-7)) + b);
    (d += (c ^ (a & (b ^ c))) + in[13] + 0xfd987193, d = (d<<12 | d>>(32-12)) + a);
    (c += (b ^ (d & (a ^ b))) + in[14] + 0xa679438e, c = (c<<17 | c>>(32-17)) + d);
    (b += (a ^ (c & (d ^ a))) + in[15] + 0x49b40821, b = (b<<22 | b>>(32-22)) + c);

    (a += (c ^ (d & (b ^ c))) + in[1] + 0xf61e2562, a = (a<<5 | a>>(32-5)) + b);
    (d += (b ^ (c & (a ^ b))) + in[6] + 0xc040b340, d = (d<<9 | d>>(32-9)) + a);
    (c += (a ^ (b & (d ^ a))) + in[11] + 0x265e5a51, c = (c<<14 | c>>(32-14)) + d);
    (b += (d ^ (a & (c ^ d))) + in[0] + 0xe9b6c7aa, b = (b<<20 | b>>(32-20)) + c);
    (a += (c ^ (d & (b ^ c))) + in[5] + 0xd62f105d, a = (a<<5 | a>>(32-5)) + b);
    (d += (b ^ (c & (a ^ b))) + in[10] + 0x02441453, d = (d<<9 | d>>(32-9)) + a);
    (c += (a ^ (b & (d ^ a))) + in[15] + 0xd8a1e681, c = (c<<14 | c>>(32-14)) + d);
    (b += (d ^ (a & (c ^ d))) + in[4] + 0xe7d3fbc8, b = (b<<20 | b>>(32-20)) + c);
    (a += (c ^ (d & (b ^ c))) + in[9] + 0x21e1cde6, a = (a<<5 | a>>(32-5)) + b);
    (d += (b ^ (c & (a ^ b))) + in[14] + 0xc33707d6, d = (d<<9 | d>>(32-9)) + a);
    (c += (a ^ (b & (d ^ a))) + in[3] + 0xf4d50d87, c = (c<<14 | c>>(32-14)) + d);
    (b += (d ^ (a & (c ^ d))) + in[8] + 0x455a14ed, b = (b<<20 | b>>(32-20)) + c);
    (a += (c ^ (d & (b ^ c))) + in[13] + 0xa9e3e905, a = (a<<5 | a>>(32-5)) + b);
    (d += (b ^ (c & (a ^ b))) + in[2] + 0xfcefa3f8, d = (d<<9 | d>>(32-9)) + a);
    (c += (a ^ (b & (d ^ a))) + in[7] + 0x676f02d9, c = (c<<14 | c>>(32-14)) + d);
    (b += (d ^ (a & (c ^ d))) + in[12] + 0x8d2a4c8a, b = (b<<20 | b>>(32-20)) + c);

    (a += (b ^ c ^ d) + in[5] + 0xfffa3942, a = (a<<4 | a>>(32-4)) + b);
    (d += (a ^ b ^ c) + in[8] + 0x8771f681, d = (d<<11 | d>>(32-11)) + a);
    (c += (d ^ a ^ b) + in[11] + 0x6d9d6122, c = (c<<16 | c>>(32-16)) + d);
    (b += (c ^ d ^ a) + in[14] + 0xfde5380c, b = (b<<23 | b>>(32-23)) + c);
    (a += (b ^ c ^ d) + in[1] + 0xa4beea44, a = (a<<4 | a>>(32-4)) + b);
    (d += (a ^ b ^ c) + in[4] + 0x4bdecfa9, d = (d<<11 | d>>(32-11)) + a);
    (c += (d ^ a ^ b) + in[7] + 0xf6bb4b60, c = (c<<16 | c>>(32-16)) + d);
    (b += (c ^ d ^ a) + in[10] + 0xbebfbc70, b = (b<<23 | b>>(32-23)) + c);
    (a += (b ^ c ^ d) + in[13] + 0x289b7ec6, a = (a<<4 | a>>(32-4)) + b);
    (d += (a ^ b ^ c) + in[0] + 0xeaa127fa, d = (d<<11 | d>>(32-11)) + a);
    (c += (d ^ a ^ b) + in[3] + 0xd4ef3085, c = (c<<16 | c>>(32-16)) + d);
    (b += (c ^ d ^ a) + in[6] + 0x04881d05, b = (b<<23 | b>>(32-23)) + c);
    (a += (b ^ c ^ d) + in[9] + 0xd9d4d039, a = (a<<4 | a>>(32-4)) + b);
    (d += (a ^ b ^ c) + in[12] + 0xe6db99e5, d = (d<<11 | d>>(32-11)) + a);
    (c += (d ^ a ^ b) + in[15] + 0x1fa27cf8, c = (c<<16 | c>>(32-16)) + d);
    (b += (c ^ d ^ a) + in[2] + 0xc4ac5665, b = (b<<23 | b>>(32-23)) + c);

    (a += (c ^ (b | ~d)) + in[0] + 0xf4292244, a = (a<<6 | a>>(32-6)) + b);
    (d += (b ^ (a | ~c)) + in[7] + 0x432aff97, d = (d<<10 | d>>(32-10)) + a);
    (c += (a ^ (d | ~b)) + in[14] + 0xab9423a7, c = (c<<15 | c>>(32-15)) + d);
    (b += (d ^ (c | ~a)) + in[5] + 0xfc93a039, b = (b<<21 | b>>(32-21)) + c);
    (a += (c ^ (b | ~d)) + in[12] + 0x655b59c3, a = (a<<6 | a>>(32-6)) + b);
    (d += (b ^ (a | ~c)) + in[3] + 0x8f0ccc92, d = (d<<10 | d>>(32-10)) + a);
    (c += (a ^ (d | ~b)) + in[10] + 0xffeff47d, c = (c<<15 | c>>(32-15)) + d);
    (b += (d ^ (c | ~a)) + in[1] + 0x85845dd1, b = (b<<21 | b>>(32-21)) + c);
    (a += (c ^ (b | ~d)) + in[8] + 0x6fa87e4f, a = (a<<6 | a>>(32-6)) + b);
    (d += (b ^ (a | ~c)) + in[15] + 0xfe2ce6e0, d = (d<<10 | d>>(32-10)) + a);
    (c += (a ^ (d | ~b)) + in[6] + 0xa3014314, c = (c<<15 | c>>(32-15)) + d);
    (b += (d ^ (c | ~a)) + in[13] + 0x4e0811a1, b = (b<<21 | b>>(32-21)) + c);
    (a += (c ^ (b | ~d)) + in[4] + 0xf7537e82, a = (a<<6 | a>>(32-6)) + b);
    (d += (b ^ (a | ~c)) + in[11] + 0xbd3af235, d = (d<<10 | d>>(32-10)) + a);
    (c += (a ^ (d | ~b)) + in[2] + 0x2ad7d2bb, c = (c<<15 | c>>(32-15)) + d);
    (b += (d ^ (c | ~a)) + in[9] + 0xeb86d391, b = (b<<21 | b>>(32-21)) + c);

    buf[0] += a;
    buf[1] += b;
    buf[2] += c;
    buf[3] += d;
}

--czRehjsqUdpaVUeF
Content-Type: text/x-c; charset=us-ascii
Content-Disposition: attachment; filename="md5_utils.c"

/*
 * This code implements the MD5 message-digest algorithm.
 * The algorithm is due to Ron Rivest.  This code was
 * written by Colin Plumb in 1993, no copyright is claimed.
 * This code is in the public domain; do with it what you wish.
 *
 * Equivalent code is available from RSA Data Security, Inc.
 * This code has been tested against that, and is equivalent,
 * except that you don't need to include two pages of legalese
 * with every copy.
 *
 * To compute the message digest of a chunk of bytes, declare an
 * MD5Context structure, pass it to MD5Init, call MD5Update as
 * needed on buffers full of bytes, and then call MD5Final, which
 * will fill a supplied 16-byte array with the digest.
 *
 * Changed so as no longer to depend on Colin Plumb's `usual.h' header
 * definitions
 *  - Ian Jackson <ian@chiark.greenend.org.uk>.
 * Still in the public domain.
 */

#include <sys/types.h>    /* for stupid systems */

#include <string.h>   /* for memcpy() */

#include "md5_utils.h"

void
byteSwap(UWORD32 *buf, unsigned words)
{
    md5byte *p;

    /* Only swap bytes for big endian machines */
    int i = 1;

    if (*(char *)&i == 1)
        return;

    p = (md5byte *)buf;

    do
    {
        *buf++ = (UWORD32)((unsigned)p[3] << 8 | p[2]) << 16 |
                 ((unsigned)p[1] << 8 | p[0]);
        p += 4;
    }
    while (--words);
}

/*
 * Start MD5 accumulation.  Set bit count to 0 and buffer to mysterious
 * initialization constants.
 */
void
MD5Init(struct MD5Context *ctx)
{
    ctx->buf[0] = 0x67452301;
    ctx->buf[1] = 0xefcdab89;
    ctx->buf[2] = 0x98badcfe;
    ctx->buf[3] = 0x10325476;

    ctx->bytes[0] = 0;
    ctx->bytes[1] = 0;
}

/*
 * Update context to reflect the concatenation of another buffer full
 * of bytes.
 */
void
MD5Update(struct MD5Context *ctx, md5byte const *buf, unsigned len)
{
    UWORD32 t;

    /* Update byte count */

    t = ctx->bytes[0];

    if ((ctx->bytes[0] = t + len) < t)
        ctx->bytes[1]++;  /* Carry from low to high */

    t = 64 - (t & 0x3f);  /* Space available in ctx->in (at least 1) */

    if (t > len)
    {
        memcpy((md5byte *)ctx->in + 64 - t, buf, len);
        return;
    }

    /* First chunk is an odd size */
    memcpy((md5byte *)ctx->in + 64 - t, buf, t);
    byteSwap(ctx->in, 16);
    MD5Transform(ctx->buf, ctx->in);
    buf += t;
    len -= t;

    /* Process data in 64-byte chunks */
    while (len >= 64)
    {
        memcpy(ctx->in, buf, 64);
        byteSwap(ctx->in, 16);
        MD5Transform(ctx->buf, ctx->in);
        buf += 64;
        len -= 64;
    }

    /* Handle any remaining bytes of data. */
    memcpy(ctx->in, buf, len);
}

/*
 * Final wrapup - pad to 64-byte boundary with the bit pattern
 * 1 0* (64-bit count of bits processed, MSB-first)
 */
void
MD5Final(md5byte digest[16], struct MD5Context *ctx)
{
    int count = ctx->bytes[0] & 0x3f; /* Number of bytes in ctx->in */
    md5byte *p = (md5byte *)ctx->in + count;

    /* Set the first char of padding to 0x80.  There is always room. */
    *p++ = 0x80;

    /* Bytes of padding needed to make 56 bytes (-8..55) */
    count = 56 - 1 - count;

    if (count < 0)    /* Padding forces an extra block */
    {
        memset(p, 0, count + 8);
        byteSwap(ctx->in, 16);
        MD5Transform(ctx->buf, ctx->in);
        p = (md5byte *)ctx->in;
        count = 56;
    }

    memset(p, 0, count);
    byteSwap(ctx->in, 14);

    /* Append length in bits and transform */
    ctx->in[14] = ctx->bytes[0] << 3;
    ctx->in[15] = ctx->bytes[1] << 3 | ctx->bytes[0] >> 29;
    MD5Transform(ctx->buf, ctx->in);

    byteSwap(ctx->buf, 4);
    memcpy(digest, ctx->buf, 16);
    memset(ctx, 0, sizeof(*ctx)); /* In case it's sensitive */
}

#ifndef ASM_MD5

/* The four core functions - F1 is optimized somewhat */

/* #define F1(x, y, z) (x & y | ~x & z) */
#define F1(x, y, z) (z ^ (x & (y ^ z)))
#define F2(x, y, z) F1(z, x, y)
#define F3(x, y, z) (x ^ y ^ z)
#define F4(x, y, z) (y ^ (x | ~z))

/* This is the central step in the MD5 algorithm. */
#define MD5STEP(f,w,x,y,z,in,s) \
    (w += f(x,y,z) + in, w = (w<<s | w>>(32-s)) + x)

/*
 * The core of the MD5 algorithm, this alters an existing MD5 hash to
 * reflect the addition of 16 longwords of new data.  MD5Update blocks
 * the data and converts bytes into longwords for this routine.
 */
void
MD5Transform(UWORD32 buf[4], UWORD32 const in[16])
{
    register UWORD32 a, b, c, d;

    a = buf[0];
    b = buf[1];
    c = buf[2];
    d = buf[3];

    MD5STEP(F1, a, b, c, d, in[0] + 0xd76aa478, 7);
    MD5STEP(F1, d, a, b, c, in[1] + 0xe8c7b756, 12);
    MD5STEP(F1, c, d, a, b, in[2] + 0x242070db, 17);
    MD5STEP(F1, b, c, d, a, in[3] + 0xc1bdceee, 22);
    MD5STEP(F1, a, b, c, d, in[4] + 0xf57c0faf, 7);
    MD5STEP(F1, d, a, b, c, in[5] + 0x4787c62a, 12);
    MD5STEP(F1, c, d, a, b, in[6] + 0xa8304613, 17);
    MD5STEP(F1, b, c, d, a, in[7] + 0xfd469501, 22);
    MD5STEP(F1, a, b, c, d, in[8] + 0x698098d8, 7);
    MD5STEP(F1, d, a, b, c, in[9] + 0x8b44f7af, 12);
    MD5STEP(F1, c, d, a, b, in[10] + 0xffff5bb1, 17);
    MD5STEP(F1, b, c, d, a, in[11] + 0x895cd7be, 22);
    MD5STEP(F1, a, b, c, d, in[12] + 0x6b901122, 7);
    MD5STEP(F1, d, a, b, c, in[13] + 0xfd987193, 12);
    MD5STEP(F1, c, d, a, b, in[14] + 0xa679438e, 17);
    MD5STEP(F1, b, c, d, a, in[15] + 0x49b40821, 22);

    MD5STEP(F2, a, b, c, d, in[1] + 0xf61e2562, 5);
    MD5STEP(F2, d, a, b, c, in[6] + 0xc040b340, 9);
    MD5STEP(F2, c, d, a, b, in[11] + 0x265e5a51, 14);
    MD5STEP(F2, b, c, d, a, in[0] + 0xe9b6c7aa, 20);
    MD5STEP(F2, a, b, c, d, in[5] + 0xd62f105d, 5);
    MD5STEP(F2, d, a, b, c, in[10] + 0x02441453, 9);
    MD5STEP(F2, c, d, a, b, in[15] + 0xd8a1e681, 14);
    MD5STEP(F2, b, c, d, a, in[4] + 0xe7d3fbc8, 20);
    MD5STEP(F2, a, b, c, d, in[9] + 0x21e1cde6, 5);
    MD5STEP(F2, d, a, b, c, in[14] + 0xc33707d6, 9);
    MD5STEP(F2, c, d, a, b, in[3] + 0xf4d50d87, 14);
    MD5STEP(F2, b, c, d, a, in[8] + 0x455a14ed, 20);
    MD5STEP(F2, a, b, c, d, in[13] + 0xa9e3e905, 5);
    MD5STEP(F2, d, a, b, c, in[2] + 0xfcefa3f8, 9);
    MD5STEP(F2, c, d, a, b, in[7] + 0x676f02d9, 14);
    MD5STEP(F2, b, c, d, a, in[12] + 0x8d2a4c8a, 20);

    MD5STEP(F3, a, b, c, d, in[5] + 0xfffa3942, 4);
    MD5STEP(F3, d, a, b, c, in[8] + 0x8771f681, 11);
    MD5STEP(F3, c, d, a, b, in[11] + 0x6d9d6122, 16);
    MD5STEP(F3, b, c, d, a, in[14] + 0xfde5380c, 23);
    MD5STEP(F3, a, b, c, d, in[1] + 0xa4beea44, 4);
    MD5STEP(F3, d, a, b, c, in[4] + 0x4bdecfa9, 11);
    MD5STEP(F3, c, d, a, b, in[7] + 0xf6bb4b60, 16);
    MD5STEP(F3, b, c, d, a, in[10] + 0xbebfbc70, 23);
    MD5STEP(F3, a, b, c, d, in[13] + 0x289b7ec6, 4);
    MD5STEP(F3, d, a, b, c, in[0] + 0xeaa127fa, 11);
    MD5STEP(F3, c, d, a, b, in[3] + 0xd4ef3085, 16);
    MD5STEP(F3, b, c, d, a, in[6] + 0x04881d05, 23);
    MD5STEP(F3, a, b, c, d, in[9] + 0xd9d4d039, 4);
    MD5STEP(F3, d, a, b, c, in[12] + 0xe6db99e5, 11);
    MD5STEP(F3, c, d, a, b, in[15] + 0x1fa27cf8, 16);
    MD5STEP(F3, b, c, d, a, in[2] + 0xc4ac5665, 23);

    MD5STEP(F4, a, b, c, d, in[0] + 0xf4292244, 6);
    MD5STEP(F4, d, a, b, c, in[7] + 0x432aff97, 10);
    MD5STEP(F4, c, d, a, b, in[14] + 0xab9423a7, 15);
    MD5STEP(F4, b, c, d, a, in[5] + 0xfc93a039, 21);
    MD5STEP(F4, a, b, c, d, in[12] + 0x655b59c3, 6);
    MD5STEP(F4, d, a, b, c, in[3] + 0x8f0ccc92, 10);
    MD5STEP(F4, c, d, a, b, in[10] + 0xffeff47d, 15);
    MD5STEP(F4, b, c, d, a, in[1] + 0x85845dd1, 21);
    MD5STEP(F4, a, b, c, d, in[8] + 0x6fa87e4f, 6);
    MD5STEP(F4, d, a, b, c, in[15] + 0xfe2ce6e0, 10);
    MD5STEP(F4, c, d, a, b, in[6] + 0xa3014314, 15);
    MD5STEP(F4, b, c, d, a, in[13] + 0x4e0811a1, 21);
    MD5STEP(F4, a, b, c, d, in[4] + 0xf7537e82, 6);
    MD5STEP(F4, d, a, b, c, in[11] + 0xbd3af235, 10);
    MD5STEP(F4, c, d, a, b, in[2] + 0x2ad7d2bb, 15);
    MD5STEP(F4, b, c, d, a, in[9] + 0xeb86d391, 21);

    buf[0] += a;
    buf[1] += b;
    buf[2] += c;
    buf[3] += d;
}

#endif

--czRehjsqUdpaVUeF--

--IX4edXMD7HczJcpd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6z9B4ACgkQN1Ujt2V2gBy9/ACfbC+68uSuh6kEn3Hqw+QJuKd8
kE0An2iCxliFv2Pr1INffYyap6Mmt6ag
=B2U8
-----END PGP SIGNATURE-----

--IX4edXMD7HczJcpd--
