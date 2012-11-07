Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TWF5Y-0007Gp-Br
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 00:31:17 +0100
Received: from mail63-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Wed, 7 Nov 2012 22:32:14 +0000
Received: from mail63-va3 (localhost [127.0.0.1])	by mail63-va3-R.bigfish.com
	(Postfix) with ESMTP id C00AD4A005A;
	Wed,  7 Nov 2012 22:32:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(zz98dI9371I1432I4015Ic8kzz1de0h1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i15d0l1155h)
Received: from mail63-va3 (localhost.localdomain [127.0.0.1]) by mail63-va3
	(MessageSwitch) id 135232753137967_16764;
	Wed,  7 Nov 2012 22:32:11 +0000 (UTC)
Received: from VA3EHSMHS004.bigfish.com (unknown [10.7.14.244])	by
	mail63-va3.bigfish.com (Postfix) with ESMTP id EFE95300133;
	Wed,  7 Nov 2012 22:32:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS004.bigfish.com
	(10.7.99.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 7 Nov 2012 22:32:10 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.103]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Wed, 7 Nov 2012 22:32:09 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe v2] inetutils: fix the issue of "ifconfig -a"
	that can not display all interfaces
Thread-Index: AQHNuOMrJDSCl4fGp0KejvbViPju3JfWkf6AgAYW3wCAAlS0gA==
Date: Wed, 7 Nov 2012 22:32:09 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A76318D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1351851620-20483-1-git-send-email-b40290@freescale.com>
	<20121102135640.GF4416@windriver.com> <5098ECC6.7000202@freescale.com>
In-Reply-To: <5098ECC6.7000202@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-oe v2] inetutils: fix the issue of "ifconfig -a" that can not display all interfaces
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
X-List-Received-Date: Wed, 07 Nov 2012 23:31:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2F28EDD05E606348961F1EF4B52B998C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 6, 2012 at 4:56 AM, chunrongguo <b40290@freescale.com> wrote:
> J,
>
> Thanks a lot for your comments.
>
> Following is the history of my patch.
> The final version(v3) can't be applied on inetutils-1.8 successfully  so =
I
> opted v3 to make sure it can be applied correctly, but build failed due t=
o
> system_functions structure definition can't be found. So I try to use v1
> which seems simple, it was also can't be applied directly, I did some
> changes for v1, it passed build and works well as expect.

Chunrong,

Have you considered just updating the recipe to a new version of the
tool? inetutils 1.9.1 is released
http://ftp.gnu.org/gnu/inetutils/?C=3DM;O=3DA

-M

>
>
> Thanks,
>
> Chunrong
>
>
>
> On Friday, November 02, 2012 09:56 PM, Joe MacDonald wrote:
>>
>> The follow-up to the previous thread was helpful.  Though I think when
>> Matthew said this:
>>
>>     This info should be in the commit message. It provides much needed
>>     context for others to review and ultimately accept this patch.
>>
>> he meant the link to the discussion would help.  I'm not sure, but it
>> certainly helped me understand what was going on here.  The below log
>> still doesn't contain enough information, so either a quick summary of
>> the discussion might help if a link to the archive isn't appropriate,
>> though I kind of think it is in this case.
>>
>> On to my real question.
>>
>> This patch looks like a modified version of the one proposed here:
>>
>>     http://www.mail-archive.com/bug-inetutils@gnu.org/msg01796.html
>>
>> Which was v1 of, I think, three before the final commit that was pushed
>> to resolve the issue.  v3 appears to be here:
>>
>>     http://www.mail-archive.com/bug-inetutils@gnu.org/msg01808.html
>>
>> But I went to the git repo directly to see what was committed and it
>> looks like this is the winner:
>>
>> commit e071c3e5b215ad725d23932ef0d2cacaa1701f17
>> Author: Giuseppe Scrivano <gscrivano@gnu.org>
>> Date:   Wed Aug 18 01:28:09 2010 +0200
>>
>>      Under GNU/Linux print interfaces without an address with ifconfig -=
a.
>>           * bootstrap.conf (gnulib_modules): Add module `read-file'.
>>           * NEWS: Update.
>>           * ifconfig/options.c (parse_cmdline): Use system_if_nameindex,
>> not
>>      if_nameindex.
>>           * ifconfig/system.h: Include <if_index.h>.
>>           * ifconfig/system/generic.c (system_if_nameindex): New variabl=
e.
>>      * ifconfig/system/hpux.c (system_if_nameindex): New variable.
>>      * ifconfig/system/osf.c (system_if_nameindex): Likewise.
>>      * ifconfig/system/qnc.c (system_if_nameindex): Likewise.
>>      * ifconfig/system/solaris.c (system_if_nameindex): Likewise.
>>           * ifconfig/system/linux.c (linux_if_nameindex): New function.
>>      (system_if_nameindex): New variable.
>>
>> Which is significantly different than what you've sent out.  Though I
>> know there was also quite a bit of discussion in the thread about
>> addressing the issue (if present) in OSes that aren't Linux, but that's
>> not really our concern here, is it?  :-)
>>
>> So, short version, can you give a bit of detail on why you opted for
>> this patch instead of the final version that was committed to the
>> inetutils tree?
>>
>> Thanks,
>> -J.
>>
>> [[oe] [meta-oe v2] inetutils: fix the issue of "ifconfig -a" that can no=
t
>> display all interfaces] On 12.11.02 (Fri 18:20) Chunrong Guo wrote:
>>
>>> "ifconfig -a" doesn't show all avaiable ethernet interfaces, the patch
>>> fixes the issue.
>>>
>>> Signed-off-by: Chunrong Guo <b40290@freescale.com>
>>> ---
>>>   ...ue-of-ifconfig-a-that-can-not-display-all.patch |  482
>>> ++++++++++++++++++++
>>>   .../inetutils/inetutils_1.8.bb                     |    3 +-
>>>   2 files changed, 484 insertions(+), 1 deletions(-)
>>>   create mode 100644
>>> meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-issue=
-of-ifconfig-a-that-can-not-display-all.patch
>>>
>>> diff --git
>>> a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-iss=
ue-of-ifconfig-a-that-can-not-display-all.patch
>>> b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-iss=
ue-of-ifconfig-a-that-can-not-display-all.patch
>>> new file mode 100644
>>> index 0000000..dd01ff2
>>> --- /dev/null
>>> +++
>>> b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-iss=
ue-of-ifconfig-a-that-can-not-display-all.patch
>>> @@ -0,0 +1,482 @@
>>> +From 7d8af05baeec680f17d6070708893f1a4f05bfa4 Mon Sep 17 00:00:00 2001
>>> +From: Chunrong Guo <b40290@freescale.com>
>>> +Date: Fri, 2 Nov 2012 01:28:37 -0500
>>> +Subject: [PATCH] fix the issue of "ifconfig -a" that can not display a=
ll
>>> + interfaces
>>> +
>>> +Upstream-Status: Accepted
>>> +
>>> +"ifconfig -a" doesn't show all avaiable ethernet interfaces, the patch
>>> can
>>> +fix the issue.
>>> +
>>> +Signed-off-by: Chunrong Guo <b40290@freescale.com>
>>> +---
>>> + ifconfig/if_index.c |  135 ++++++++++++++++++++++++++----------
>>> + lib/gnulib.mk       |    9 +++
>>> + lib/read-file.c     |  191
>>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>> + lib/read-file.h     |   36 ++++++++++
>>> + 4 files changed, 333 insertions(+), 38 deletions(-)
>>> + create mode 100644 lib/read-file.c
>>> + create mode 100644 lib/read-file.h
>>> +
>>> +diff --git a/ifconfig/if_index.c b/ifconfig/if_index.c
>>> +index e2737c2..5fb0ac7 100644
>>> +--- a/ifconfig/if_index.c
>>> ++++ b/ifconfig/if_index.c
>>> +@@ -28,7 +28,7 @@
>>> + #include <unistd.h>
>>> + #include <sys/types.h>
>>> + #include <sys/socket.h>
>>> +-
>>> ++#include <read-file.h>
>>> + /* Solaris at least earlier 2.6 and before does not include
>>> +    the ioctl definitions if BSD_COMP is not set.  */
>>> + #if defined(__svr4__)
>>> +@@ -97,24 +97,29 @@ if_freenameindex (struct if_nameindex *ifn)
>>> + struct if_nameindex *
>>> + if_nameindex (void)
>>> + {
>>> +-#if defined(SIOCGIFCONF)
>>> +-  int fd =3D socket (AF_INET, SOCK_DGRAM, 0);
>>> +-  struct ifconf ifc;
>>> +-  unsigned int i =3D 0;
>>> +-  int rq_len, last_len;
>>> +-  struct if_nameindex *idx =3D NULL;
>>> +-  struct ifreq *ifr, *end, *cur;
>>> ++  //printk("if_nameindex\n");
>>> +
>>> ++//#if defined(SIOCGIFCONF)
>>> ++//  int fd =3D socket (AF_INET, SOCK_DGRAM, 0);
>>> ++//  struct ifconf ifc;
>>> ++//  unsigned int i =3D 0;
>>> ++//  int rq_len, last_len;
>>> ++    char *content, *it;
>>> ++    size_t length, index;
>>> ++    struct if_nameindex *idx =3D NULL;
>>> ++//  struct ifreq *ifr, *end, *cur;
>>> ++     int fd;
>>> ++    fd =3D socket (AF_INET, SOCK_DGRAM, 0);
>>> +   if (fd < 0)
>>> +     return NULL;
>>> +
>>> +   /* A first estimate.  */
>>> +-  rq_len =3D 4 * sizeof (struct ifreq);
>>> ++ // rq_len =3D 4 * sizeof (struct ifreq);
>>> +
>>> +-  ifc.ifc_buf =3D NULL;
>>> +-  ifc.ifc_len =3D 0;
>>> ++//  ifc.ifc_buf =3D NULL;
>>> ++//  ifc.ifc_len =3D 0;
>>> +   /* Read all the interfaces out of the kernel.  */
>>> +-  do
>>> ++/*  do
>>> +     {
>>> +       last_len =3D ifc.ifc_len;
>>> +       ifc.ifc_buf =3D alloca (ifc.ifc_len =3D rq_len);
>>> +@@ -142,30 +147,59 @@ if_nameindex (void)
>>> + # endif
>>> +
>>> +       cur =3D ifr;
>>> +-
>>> +-      /* Step along the array by the size of the current structure */
>>> +-      ifr =3D (struct ifreq *) ((caddr_t) ifr + len + IFNAMSIZ);
>>> ++*/
>>> ++      content =3D read_file (PATH_PROCNET_DEV, &length);
>>> ++      if (content =3D=3D NULL)
>>> ++         return NULL;
>>> ++         /* Count how many interfaces we have.  */
>>> ++   {
>>> ++    size_t n =3D 0;
>>> ++    it =3D content;
>>> ++    do
>>> ++      {
>>> ++        it =3D memchr (it + 1, ':', length - (it - content));
>>> ++        n++;
>>> ++      }
>>> ++    while (it);
>>> ++
>>> ++     /* Step along the array by the size of the current structure */
>>> ++     // ifr =3D (struct ifreq *) ((caddr_t) ifr + len + IFNAMSIZ);
>>> +
>>> +       /* We ignore the other families .. OK ?  */
>>> +-      if (cur->ifr_addr.sa_family !=3D AF_INET)
>>> +-      continue;
>>> +-
>>> ++    //  if (cur->ifr_addr.sa_family !=3D AF_INET)
>>> ++      //continue;
>>> ++   idx =3D malloc (n * sizeof(*idx));
>>> ++   if (idx =3D=3D NULL)
>>> +       /* Make Room safely.  */
>>> +       {
>>> +-      struct if_nameindex *tidx =3D NULL;
>>> +-      tidx =3D realloc (idx, (i + 1) * sizeof (*idx));
>>> +-      if (tidx =3D=3D NULL)
>>> +-        {
>>> +-          if_freenameindex (idx);
>>> +-          close (fd);
>>> +-          errno =3D ENOBUFS;
>>> +-          return NULL;
>>> +-        }
>>> +-      idx =3D tidx;
>>> ++      //struct if_nameindex *tidx =3D NULL;
>>> ++      //tidx =3D realloc (idx, (i + 1) * sizeof (*idx));
>>> ++      //if (tidx =3D=3D NULL)
>>> ++      //  {
>>> ++       //   if_freenameindex (idx);
>>> ++        //  close (fd);
>>> ++         // errno =3D ENOBUFS;
>>> ++        //  return NULL;
>>> ++       // }
>>> ++//    idx =3D tidx;
>>> ++      int saved_errno =3D errno;
>>> ++      close (fd);
>>> ++      free(content);
>>> ++      errno =3D saved_errno;
>>> ++     return NULL;
>>> +       }
>>> +-
>>> ++  }
>>> +       /* FIXME: We did not deal with duplicates or interface aliases.
>>> */
>>> ++  for (it =3D memchr (content, ':', length), index =3D 0; it;
>>> ++       it =3D memchr (it, ':', it - content), index++)
>>> ++    {
>>> ++      char *start =3D it - 1;
>>> ++      *it =3D '\0';
>>> +
>>> ++      while (*start !=3D ' ' && *start !=3D '\n')
>>> ++        start--;
>>> ++
>>> ++/*
>>> +       idx[i].if_name =3D strdup (cur->ifr_name);
>>> +       if (idx[i].if_name =3D=3D NULL)
>>> +       {
>>> +@@ -174,18 +208,38 @@ if_nameindex (void)
>>> +         errno =3D ENOBUFS;
>>> +         return NULL;
>>> +       }
>>> ++*/
>>> ++      idx[index].if_name =3D strdup (start + 1);
>>> ++      idx[index].if_index =3D index + 1;
>>> +
>>> + # if defined(SIOCGIFINDEX)
>>> +-      if (ioctl (fd, SIOCGIFINDEX, cur) >=3D 0)
>>> +-      idx[i].if_index =3D cur->ifr_index;
>>> +-      else
>>> ++  //    if (ioctl (fd, SIOCGIFINDEX, cur) >=3D 0)
>>> ++//    idx[i].if_index =3D cur->ifr_index;
>>> ++ //     else
>>> ++    {
>>> ++        struct ifreq cur;
>>> ++        strcpy (cur.ifr_name, idx[index].if_name);
>>> ++        cur.ifr_index =3D -1;
>>> ++        if (ioctl (fd, SIOCGIFINDEX, &cur) >=3D 0)
>>> ++          idx[index].if_index =3D cur.ifr_index;
>>> ++      }
>>> ++
>>> + # endif
>>> +-      idx[i].if_index =3D i + 1;
>>> +-      i++;
>>> ++//    idx[i].if_index =3D i + 1;
>>> ++ //      i++;
>>> ++   if (idx[index].if_name =3D=3D NULL)
>>> ++        {
>>> ++          int saved_errno =3D errno;
>>> ++          close (fd);
>>> ++          free (content);
>>> ++          errno =3D saved_errno;
>>> ++          return NULL;
>>> ++        }
>>> ++
>>> +     }
>>> +
>>> +   /* Terminate the array with an empty solt.  */
>>> +-  {
>>> ++/*  {
>>> +     struct if_nameindex *tidx =3D NULL;
>>> +     tidx =3D realloc (idx, (i + 1) * sizeof (*idx));
>>> +     if (tidx =3D=3D NULL)
>>> +@@ -199,14 +253,19 @@ if_nameindex (void)
>>> +   }
>>> +   idx[i].if_index =3D 0;
>>> +   idx[i].if_name =3D NULL;
>>> +-
>>> +-  close (fd);
>>> ++*/
>>> ++  idx[index].if_index =3D 0;
>>> ++  idx[index].if_name =3D NULL;
>>> ++
>>> ++ // close (fd);
>>> ++ free(content);
>>> +   return idx;
>>> +-
>>> ++/*
>>> + #else
>>> +   errno =3D ENOSYS;
>>> +   return NULL;
>>> + #endif
>>> ++*/
>>> + }
>>> +
>>> + char *
>>> +diff --git a/lib/gnulib.mk b/lib/gnulib.mk
>>> +index ebc3b22..defb086 100644
>>> +--- a/lib/gnulib.mk
>>> ++++ b/lib/gnulib.mk
>>> +@@ -111,6 +111,15 @@ libgnu_a_SOURCES +=3D argp-version-etc.h
>>> argp-version-etc.c
>>> +
>>> + ## end   gnulib module argp-version-etc
>>> +
>>> ++
>>> ++## begin gnulib module read-file
>>> ++
>>> ++libgnu_a_SOURCES +=3D read-file.c
>>> ++
>>> ++EXTRA_DIST +=3D read-file.h
>>> ++
>>> ++## end   gnulib module read-file
>>> ++
>>> + ## begin gnulib module arpa_inet
>>> +
>>> + BUILT_SOURCES +=3D arpa/inet.h
>>> +diff --git a/lib/read-file.c b/lib/read-file.c
>>> +new file mode 100644
>>> +index 0000000..ba7aef3
>>> +--- /dev/null
>>> ++++ b/lib/read-file.c
>>> +@@ -0,0 +1,191 @@
>>> ++/* -*- buffer-read-only: t -*- vi: set ro: */
>>> ++/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
>>> ++/* read-file.c -- read file contents into a string
>>> ++   Copyright (C) 2006, 2009-2011 Free Software Foundation, Inc.
>>> ++   Written by Simon Josefsson and Bruno Haible.
>>> ++
>>> ++   This program is free software; you can redistribute it and/or modi=
fy
>>> ++   it under the terms of the GNU General Public License as published =
by
>>> ++   the Free Software Foundation; either version 3, or (at your option=
)
>>> ++   any later version.
>>> ++
>>> ++   This program is distributed in the hope that it will be useful,
>>> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> ++   GNU General Public License for more details.
>>> ++
>>> ++   You should have received a copy of the GNU General Public License
>>> ++   along with this program; if not, write to the Free Software
>>> Foundation,
>>> ++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
>>> */
>>> ++
>>> ++#include <config.h>
>>> ++
>>> ++#include "read-file.h"
>>> ++
>>> ++/* Get fstat.  */
>>> ++#include <sys/stat.h>
>>> ++
>>> ++/* Get ftello.  */
>>> ++#include <stdio.h>
>>> ++
>>> ++/* Get SIZE_MAX.  */
>>> ++#include <stdint.h>
>>> ++
>>> ++/* Get malloc, realloc, free. */
>>> ++#include <stdlib.h>
>>> ++
>>> ++/* Get errno. */
>>> ++#include <errno.h>
>>> ++
>>> ++/* Read a STREAM and return a newly allocated string with the content=
,
>>> ++   and set *LENGTH to the length of the string.  The string is
>>> ++   zero-terminated, but the terminating zero byte is not counted in
>>> ++   *LENGTH.  On errors, *LENGTH is undefined, errno preserves the
>>> ++   values set by system functions (if any), and NULL is returned.  */
>>> ++char *
>>> ++fread_file (FILE *stream, size_t *length)
>>> ++{
>>> ++  char *buf =3D NULL;
>>> ++  size_t alloc =3D BUFSIZ;
>>> ++
>>> ++  /* For a regular file, allocate a buffer that has exactly the right
>>> ++     size.  This avoids the need to do dynamic reallocations later.  =
*/
>>> ++  {
>>> ++    struct stat st;
>>> ++
>>> ++    if (fstat (fileno (stream), &st) >=3D 0 && S_ISREG (st.st_mode))
>>> ++      {
>>> ++        off_t pos =3D ftello (stream);
>>> ++
>>> ++        if (pos >=3D 0 && pos < st.st_size)
>>> ++          {
>>> ++            off_t alloc_off =3D st.st_size - pos;
>>> ++
>>> ++            /* '1' below, accounts for the trailing NUL.  */
>>> ++            if (SIZE_MAX - 1 < alloc_off)
>>> ++              {
>>> ++                errno =3D ENOMEM;
>>> ++                return NULL;
>>> ++              }
>>> ++
>>> ++            alloc =3D alloc_off + 1;
>>> ++          }
>>> ++      }
>>> ++  }
>>> ++
>>> ++  if (!(buf =3D malloc (alloc)))
>>> ++    return NULL; /* errno is ENOMEM.  */
>>> ++
>>> ++  {
>>> ++    size_t size =3D 0; /* number of bytes read so far */
>>> ++    int save_errno;
>>> ++
>>> ++    for (;;)
>>> ++      {
>>> ++        /* This reads 1 more than the size of a regular file
>>> ++           so that we get eof immediately.  */
>>> ++        size_t requested =3D alloc - size;
>>> ++        size_t count =3D fread (buf + size, 1, requested, stream);
>>> ++        size +=3D count;
>>> ++
>>> ++        if (count !=3D requested)
>>> ++          {
>>> ++            save_errno =3D errno;
>>> ++            if (ferror (stream))
>>> ++              break;
>>> ++
>>> ++            /* Shrink the allocated memory if possible.  */
>>> ++            if (size < alloc - 1)
>>> ++              {
>>> ++                char *smaller_buf =3D realloc (buf, size + 1);
>>> ++                if (smaller_buf !=3D NULL)
>>> ++                  buf =3D smaller_buf;
>>> ++              }
>>> ++
>>> ++            buf[size] =3D '\0';
>>> ++            *length =3D size;
>>> ++            return buf;
>>> ++          }
>>> ++
>>> ++        {
>>> ++          char *new_buf;
>>> ++
>>> ++          if (alloc =3D=3D SIZE_MAX)
>>> ++            {
>>> ++              save_errno =3D ENOMEM;
>>> ++              break;
>>> ++            }
>>> ++
>>> ++          if (alloc < SIZE_MAX - alloc / 2)
>>> ++            alloc =3D alloc + alloc / 2;
>>> ++          else
>>> ++            alloc =3D SIZE_MAX;
>>> ++
>>> ++          if (!(new_buf =3D realloc (buf, alloc)))
>>> ++            {
>>> ++              save_errno =3D errno;
>>> ++              break;
>>> ++            }
>>> ++
>>> ++          buf =3D new_buf;
>>> ++        }
>>> ++      }
>>> ++
>>> ++    free (buf);
>>> ++    errno =3D save_errno;
>>> ++    return NULL;
>>> ++  }
>>> ++}
>>> ++
>>> ++static char *
>>> ++internal_read_file (const char *filename, size_t *length, const char
>>> *mode)
>>> ++{
>>> ++  FILE *stream =3D fopen (filename, mode);
>>> ++  char *out;
>>> ++  int save_errno;
>>> ++
>>> ++  if (!stream)
>>> ++    return NULL;
>>> ++
>>> ++  out =3D fread_file (stream, length);
>>> ++
>>> ++  save_errno =3D errno;
>>> ++
>>> ++  if (fclose (stream) !=3D 0)
>>> ++    {
>>> ++      if (out)
>>> ++        {
>>> ++          save_errno =3D errno;
>>> ++          free (out);
>>> ++        }
>>> ++      errno =3D save_errno;
>>> ++      return NULL;
>>> ++    }
>>> ++
>>> ++  return out;
>>> ++}
>>> ++
>>> ++/* Open and read the contents of FILENAME, and return a newly
>>> ++   allocated string with the content, and set *LENGTH to the length o=
f
>>> ++   the string.  The string is zero-terminated, but the terminating
>>> ++   zero byte is not counted in *LENGTH.  On errors, *LENGTH is
>>> ++   undefined, errno preserves the values set by system functions (if
>>> ++   any), and NULL is returned.  */
>>> ++char *
>>> ++read_file (const char *filename, size_t *length)
>>> ++{
>>> ++  return internal_read_file (filename, length, "r");
>>> ++}
>>> ++
>>> ++/* Open (on non-POSIX systems, in binary mode) and read the contents
>>> ++   of FILENAME, and return a newly allocated string with the content,
>>> ++   and set LENGTH to the length of the string.  The string is
>>> ++   zero-terminated, but the terminating zero byte is not counted in
>>> ++   the LENGTH variable.  On errors, *LENGTH is undefined, errno
>>> ++   preserves the values set by system functions (if any), and NULL is
>>> ++   returned.  */
>>> ++char *
>>> ++read_binary_file (const char *filename, size_t *length)
>>> ++{
>>> ++  return internal_read_file (filename, length, "rb");
>>> ++}
>>> +diff --git a/lib/read-file.h b/lib/read-file.h
>>> +new file mode 100644
>>> +index 0000000..14041dc
>>> +--- /dev/null
>>> ++++ b/lib/read-file.h
>>> +@@ -0,0 +1,36 @@
>>> ++/* -*- buffer-read-only: t -*- vi: set ro: */
>>> ++/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
>>> ++/* read-file.h -- read file contents into a string
>>> ++   Copyright (C) 2006, 2009-2011 Free Software Foundation, Inc.
>>> ++   Written by Simon Josefsson.
>>> ++
>>> ++   This program is free software; you can redistribute it and/or modi=
fy
>>> ++   it under the terms of the GNU General Public License as published =
by
>>> ++   the Free Software Foundation; either version 3, or (at your option=
)
>>> ++   any later version.
>>> ++
>>> ++   This program is distributed in the hope that it will be useful,
>>> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> ++   GNU General Public License for more details.
>>> ++
>>> ++   You should have received a copy of the GNU General Public License
>>> ++   along with this program; if not, write to the Free Software
>>> Foundation,
>>> ++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
>>> */
>>> ++
>>> ++#ifndef READ_FILE_H
>>> ++#define READ_FILE_H
>>> ++
>>> ++/* Get size_t.  */
>>> ++#include <stddef.h>
>>> ++
>>> ++/* Get FILE.  */
>>> ++#include <stdio.h>
>>> ++
>>> ++extern char *fread_file (FILE * stream, size_t * length);
>>> ++
>>> ++extern char *read_file (const char *filename, size_t * length);
>>> ++
>>> ++extern char *read_binary_file (const char *filename, size_t * length)=
;
>>> ++
>>> ++#endif /* READ_FILE_H */
>>> +--
>>> +1.7.9.7
>>> +
>>> diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>>> b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>>> index 761b2e6..a3b4359 100644
>>> --- a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>>> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>>> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
>>>     LIC_FILES_CHKSUM =3D
>>> "file://COPYING;md5=3Dadefda309052235aa5d1e99ce7557010"
>>>   -PR =3D "r1"
>>> +PR =3D "r2"
>>>     SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>>>
>>> file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__=
.patch
>>> \
>>> @@ -22,6 +22,7 @@ SRC_URI =3D
>>> "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>>>              file://fix-disable-ipv6.patch \
>>>              file://disable-pre-ANSI-compilers.patch \
>>>              file://remove_gets.patch \
>>> +
>>> file://0001-fix-the-issue-of-ifconfig-a-that-can-not-display-all.patch =
\
>>>   "
>>>   SRC_URI[md5sum] =3D "ad8fdcdf1797b9ca258264a6b04e48fd"
>>>   SRC_URI[sha256sum] =3D
>>> "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



