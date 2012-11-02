Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TU7QT-0003fE-KZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 03:56:06 +0100
Received: from mail14-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 2 Nov 2012 02:27:18 +0000
Received: from mail14-tx2 (localhost [127.0.0.1])	by mail14-tx2-R.bigfish.com
	(Postfix) with ESMTP id 8C03B16008B;
	Fri,  2 Nov 2012 02:27:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -16
X-BigFish: VS-16(zz98dI9371I936eI9f17R542M1432I12d5Ic8kzz1de0h1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i1155h)
Received: from mail14-tx2 (localhost.localdomain [127.0.0.1]) by mail14-tx2
	(MessageSwitch) id 1351823236185015_24404;
	Fri,  2 Nov 2012 02:27:16 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.241])	by
	mail14-tx2.bigfish.com (Postfix) with ESMTP id 20F2518008C;
	Fri,  2 Nov 2012 02:27:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS023.bigfish.com
	(10.9.99.123) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 2 Nov 2012 02:27:16 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.103]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Fri, 2 Nov 2012 02:27:15 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Thread-Topic: [oe] [meta-oe ] inetutils: ifconfig -a includes interfaces
	without an address
Thread-Index: AQHNuBcZQD/3sQ3F8UyaPZXz7BKo7JfVCbuAgAAOj4CAALcjAIAAA22A
Date: Fri, 2 Nov 2012 02:27:14 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A749D29@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1351763967-14739-1-git-send-email-b40290@freescale.com>
	<20121101142701.GE4673@windriver.com>
	<70CC66F5C30A414DADDA6973E4CA391A744FEF@039-SN1MPN1-001.039d.mgd.msft.net>
	<CA452391058F6D4E9715FB2C29D9312A0134035C@039-SN2MPN1-021.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A0134035C@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-oe ] inetutils: ifconfig -a includes interfaces without an address
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
X-List-Received-Date: Fri, 02 Nov 2012 02:56:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7C5681492A6D1C48A063AAD096F09174@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 1, 2012 at 9:14 PM, Luo Zhenhua-B19537 <B19537@freescale.com> w=
rote:
> The patch fixes "inetutils.ifconfig -a" doesn't show all interfaces.
>
> More story is in http://www.mail-archive.com/bug-inetutils@gnu.org/msg017=
45.html

This info should be in the commit message. It provides much needed
context for others to review and ultimately accept this patch.

-M

>
>
> Best Regards,
>
> Zhenhua
>
>> -----Original Message-----
>> From: McClintock Matthew-B29882
>> Sent: Thursday, November 01, 2012 11:19 PM
>> To: Joe MacDonald
>> Cc: openembedded-devel@lists.openembedded.org; McClintock Matthew-B29882=
;
>> Luo Zhenhua-B19537
>> Subject: Re: [oe] [meta-oe ] inetutils: ifconfig -a includes interfaces
>> without an address
>>
>> On Thu, Nov 1, 2012 at 9:27 AM, Joe MacDonald
>> <Joe.MacDonald@windriver.com> wrote:
>> > [[oe] [meta-oe ] inetutils: ifconfig -a includes interfaces without an
>> address] On 12.11.01 (Thu 17:59) Chunrong Guo wrote:
>> >
>> >>       *ifconfig/if_index.c (if_nameindex): Remove local variables
>> >>         `ifc', `i', `rq_len', `last_len', `ifr', `end', `cur'.
>> >>         Add local variables `content', `it', `length', `index'.
>> >>         Remove code that uses the SIOCGIFCONF ioctl to get the
>> interfaces
>> >>         list.  Parse the PATH_PROCNET_DEV file to fetch the list of
>> >>         interfaces.
>> >> Signed-off-by: Chunrong Guo <b40290@freescale.com>
>> >
>> > I'm still not understanding the objective of these changes.  The above
>> > commit log says what you're doing, but I cannot tell why.  Since the
>> > patch itself is leaving largeish chunks of code commented out and/or
>> > dead, removing previous ifdef's and using an inconsistent style, it's
>> > kind of caught my attention and I can't help asking why.
>> >
>> > Particularly since the short log message seems to me that you're
>> > trying to change existing, documented and reasonably correct
>> > behaviour.  What's actually broken here?
>>
>> Chunrong,
>>
>> I'm having a hard time parsing this as well... is this fixing the issue
>> with ifconfig were we are not seeing all the ethernet interfaces?
>>
>> -M
>>
>> >
>> > -J.
>> >
>> >> ---
>> >>  .../inetutils/inetutils-1.8/15.patch               |  197
>> +++++++++++++++
>> >>  .../inetutils/inetutils-1.8/add-module.patch       |   18 ++
>> >>  .../inetutils/inetutils-1.8/add-readfile.patch     |  250
>> ++++++++++++++++++++
>> >>  .../inetutils/inetutils_1.8.bb                     |    3 +
>> >>  4 files changed, 468 insertions(+), 0 deletions(-)  create mode
>> >> 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/15.patch
>> >>  create mode 100644
>> >> meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-module.patch
>> >>  create mode 100644
>> >> meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-readfile.pat
>> >> ch
>> >>
>> >> diff --git
>> >> a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/15.patch
>> >> b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/15.patch
>> >> new file mode 100644
>> >> index 0000000..c2d4f11
>> >> --- /dev/null
>> >> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/15.patch
>> >> @@ -0,0 +1,197 @@
>> >> +--- inetutils-1.8/ifconfig/if_index.c        2010-05-15
>> 06:25:47.000000000 -0500
>> >> ++++ ../inetutils-1.8-r0+fsl.1/inetutils-1.8/ifconfig/if_index.c
>> 2012-10-30 04:03:19.595348659 -0500
>> >> +@@ -28,7 +28,7 @@
>> >> + #include <unistd.h>
>> >> + #include <sys/types.h>
>> >> + #include <sys/socket.h>
>> >> +-
>> >> ++#include <read-file.h>
>> >> + /* Solaris at least earlier 2.6 and before does not include
>> >> +    the ioctl definitions if BSD_COMP is not set.  */  #if
>> >> +defined(__svr4__) @@ -97,24 +97,29 @@  struct if_nameindex *
>> >> +if_nameindex (void)  { -#if defined(SIOCGIFCONF)
>> >> +-  int fd =3D socket (AF_INET, SOCK_DGRAM, 0);
>> >> +-  struct ifconf ifc;
>> >> +-  unsigned int i =3D 0;
>> >> +-  int rq_len, last_len;
>> >> +-  struct if_nameindex *idx =3D NULL;
>> >> +-  struct ifreq *ifr, *end, *cur;
>> >> ++  //printk("if_nameindex\n");
>> >> +
>> >> ++//#if defined(SIOCGIFCONF)
>> >> ++//  int fd =3D socket (AF_INET, SOCK_DGRAM, 0); //  struct ifconf
>> >> ++ifc; //  unsigned int i =3D 0; //  int rq_len, last_len;
>> >> ++    char *content, *it;
>> >> ++    size_t length, index;
>> >> ++    struct if_nameindex *idx =3D NULL; //  struct ifreq *ifr, *end,
>> >> ++*cur;
>> >> ++     int fd;
>> >> ++    fd =3D socket (AF_INET, SOCK_DGRAM, 0);
>> >> +   if (fd < 0)
>> >> +     return NULL;
>> >> +
>> >> +   /* A first estimate.  */
>> >> +-  rq_len =3D 4 * sizeof (struct ifreq);
>> >> ++ // rq_len =3D 4 * sizeof (struct ifreq);
>> >> +
>> >> +-  ifc.ifc_buf =3D NULL;
>> >> +-  ifc.ifc_len =3D 0;
>> >> ++//  ifc.ifc_buf =3D NULL;
>> >> ++//  ifc.ifc_len =3D 0;
>> >> +   /* Read all the interfaces out of the kernel.  */
>> >> +-  do
>> >> ++/*  do
>> >> +     {
>> >> +       last_len =3D ifc.ifc_len;
>> >> +       ifc.ifc_buf =3D alloca (ifc.ifc_len =3D rq_len); @@ -142,30
>> >> ++147,59 @@  # endif
>> >> +
>> >> +       cur =3D ifr;
>> >> +-
>> >> +-      /* Step along the array by the size of the current structure
>> */
>> >> +-      ifr =3D (struct ifreq *) ((caddr_t) ifr + len + IFNAMSIZ);
>> >> ++*/
>> >> ++      content =3D read_file (PATH_PROCNET_DEV, &length);
>> >> ++      if (content =3D=3D NULL)
>> >> ++         return NULL;
>> >> ++         /* Count how many interfaces we have.  */
>> >> ++   {
>> >> ++    size_t n =3D 0;
>> >> ++    it =3D content;
>> >> ++    do
>> >> ++      {
>> >> ++        it =3D memchr (it + 1, ':', length - (it - content));
>> >> ++        n++;
>> >> ++      }
>> >> ++    while (it);
>> >> ++
>> >> ++     /* Step along the array by the size of the current structure *=
/
>> >> ++     // ifr =3D (struct ifreq *) ((caddr_t) ifr + len + IFNAMSIZ);
>> >> +
>> >> +       /* We ignore the other families .. OK ?  */
>> >> +-      if (cur->ifr_addr.sa_family !=3D AF_INET)
>> >> +-    continue;
>> >> +-
>> >> ++    //  if (cur->ifr_addr.sa_family !=3D AF_INET)
>> >> ++    //continue;
>> >> ++   idx =3D malloc (n * sizeof(*idx));
>> >> ++   if (idx =3D=3D NULL)
>> >> +       /* Make Room safely.  */
>> >> +       {
>> >> +-    struct if_nameindex *tidx =3D NULL;
>> >> +-    tidx =3D realloc (idx, (i + 1) * sizeof (*idx));
>> >> +-    if (tidx =3D=3D NULL)
>> >> +-      {
>> >> +-        if_freenameindex (idx);
>> >> +-        close (fd);
>> >> +-        errno =3D ENOBUFS;
>> >> +-        return NULL;
>> >> +-      }
>> >> +-    idx =3D tidx;
>> >> ++    //struct if_nameindex *tidx =3D NULL;
>> >> ++    //tidx =3D realloc (idx, (i + 1) * sizeof (*idx));
>> >> ++    //if (tidx =3D=3D NULL)
>> >> ++    //  {
>> >> ++     //   if_freenameindex (idx);
>> >> ++      //  close (fd);
>> >> ++       // errno =3D ENOBUFS;
>> >> ++      //  return NULL;
>> >> ++     // }
>> >> ++//  idx =3D tidx;
>> >> ++      int saved_errno =3D errno;
>> >> ++      close (fd);
>> >> ++      free(content);
>> >> ++      errno =3D saved_errno;
>> >> ++     return NULL;
>> >> +       }
>> >> +-
>> >> ++  }
>> >> +       /* FIXME: We did not deal with duplicates or interface
>> >> + aliases.  */
>> >> ++  for (it =3D memchr (content, ':', length), index =3D 0; it;
>> >> ++       it =3D memchr (it, ':', it - content), index++)
>> >> ++    {
>> >> ++      char *start =3D it - 1;
>> >> ++      *it =3D '\0';
>> >> ++
>> >> ++      while (*start !=3D ' ' && *start !=3D '\n')
>> >> ++        start--;
>> >> +
>> >> ++/*
>> >> +       idx[i].if_name =3D strdup (cur->ifr_name);
>> >> +       if (idx[i].if_name =3D=3D NULL)
>> >> +     {
>> >> +@@ -174,18 +208,38 @@
>> >> +       errno =3D ENOBUFS;
>> >> +       return NULL;
>> >> +     }
>> >> ++*/
>> >> ++      idx[index].if_name =3D strdup (start + 1);
>> >> ++      idx[index].if_index =3D index + 1;
>> >> +
>> >> + # if defined(SIOCGIFINDEX)
>> >> +-      if (ioctl (fd, SIOCGIFINDEX, cur) >=3D 0)
>> >> +-    idx[i].if_index =3D cur->ifr_index;
>> >> +-      else
>> >> ++  //    if (ioctl (fd, SIOCGIFINDEX, cur) >=3D 0)
>> >> ++//  idx[i].if_index =3D cur->ifr_index;
>> >> ++ //     else
>> >> ++    {
>> >> ++        struct ifreq cur;
>> >> ++        strcpy (cur.ifr_name, idx[index].if_name);
>> >> ++        cur.ifr_index =3D -1;
>> >> ++        if (ioctl (fd, SIOCGIFINDEX, &cur) >=3D 0)
>> >> ++          idx[index].if_index =3D cur.ifr_index;
>> >> ++      }
>> >> ++
>> >> + # endif
>> >> +-    idx[i].if_index =3D i + 1;
>> >> +-      i++;
>> >> ++//  idx[i].if_index =3D i + 1;
>> >> ++ //      i++;
>> >> ++   if (idx[index].if_name =3D=3D NULL)
>> >> ++        {
>> >> ++          int saved_errno =3D errno;
>> >> ++          close (fd);
>> >> ++          free (content);
>> >> ++          errno =3D saved_errno;
>> >> ++          return NULL;
>> >> ++        }
>> >> ++
>> >> +     }
>> >> +
>> >> +   /* Terminate the array with an empty solt.  */
>> >> +-  {
>> >> ++/*  {
>> >> +     struct if_nameindex *tidx =3D NULL;
>> >> +     tidx =3D realloc (idx, (i + 1) * sizeof (*idx));
>> >> +     if (tidx =3D=3D NULL)
>> >> +@@ -199,14 +253,19 @@
>> >> +   }
>> >> +   idx[i].if_index =3D 0;
>> >> +   idx[i].if_name =3D NULL;
>> >> +-
>> >> +-  close (fd);
>> >> ++*/
>> >> ++  idx[index].if_index =3D 0;
>> >> ++  idx[index].if_name =3D NULL;
>> >> ++
>> >> ++ // close (fd);
>> >> ++ free(content);
>> >> +   return idx;
>> >> +-
>> >> ++/*
>> >> + #else
>> >> +   errno =3D ENOSYS;
>> >> +   return NULL;
>> >> + #endif
>> >> ++*/
>> >> + }
>> >> +
>> >> + char *
>> >> diff --git
>> >> a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-module.pat
>> >> ch
>> >> b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-module.pat
>> >> ch
>> >> new file mode 100644
>> >> index 0000000..7acc3a4
>> >> --- /dev/null
>> >> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-module
>> >> +++ .patch
>> >> @@ -0,0 +1,18 @@
>> >> +--- inetutils-1.8/lib/gnulib.mk      2010-05-15 06:34:54.000000000 -
>> 0500
>> >> ++++ inetutils-1.8/lib/gnulib.mk      2012-10-29 21:50:44.821671025 -
>> 0500
>> >> +@@ -111,6 +111,15 @@
>> >> +
>> >> + ## end   gnulib module argp-version-etc
>> >> +
>> >> ++
>> >> ++## begin gnulib module read-file
>> >> ++
>> >> ++libgnu_a_SOURCES +=3D read-file.c
>> >> ++
>> >> ++EXTRA_DIST +=3D read-file.h
>> >> ++
>> >> ++## end   gnulib module read-file
>> >> ++
>> >> + ## begin gnulib module arpa_inet
>> >> +
>> >> + BUILT_SOURCES +=3D arpa/inet.h
>> >> diff --git
>> >> a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-readfile.p
>> >> atch
>> >> b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-readfile.p
>> >> atch
>> >> new file mode 100644
>> >> index 0000000..bb18ae9
>> >> --- /dev/null
>> >> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/add-readfi
>> >> +++ le.patch
>> >> @@ -0,0 +1,250 @@
>> >> +Signed-off-by: Chunrong Guo <b40290@freescale.com>
>> >> +---
>> >> + inetutils-1.8/lib/read-file.c |  191
>> +++++++++++++++++++++++++++++++++++++++++
>> >> + inetutils-1.8/lib/read-file.h |   36 ++++++++
>> >> + 2 files changed, 227 insertions(+)
>> >> + create mode 100644 inetutils-1.8/lib/read-file.c  create mode
>> >> +100644 inetutils-1.8/lib/read-file.h
>> >> +
>> >> +diff --git a/lib/read-file.c b/lib/read-file.c new file mode 100644
>> >> +index 0000000..ba7aef3
>> >> +--- /dev/null
>> >> ++++ b/lib/read-file.c
>> >> +@@ -0,0 +1,191 @@
>> >> ++/* -*- buffer-read-only: t -*- vi: set ro: */
>> >> ++/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
>> >> ++/* read-file.c -- read file contents into a string
>> >> ++   Copyright (C) 2006, 2009-2011 Free Software Foundation, Inc.
>> >> ++   Written by Simon Josefsson and Bruno Haible.
>> >> ++
>> >> ++   This program is free software; you can redistribute it and/or
>> modify
>> >> ++   it under the terms of the GNU General Public License as publishe=
d
>> by
>> >> ++   the Free Software Foundation; either version 3, or (at your
>> option)
>> >> ++   any later version.
>> >> ++
>> >> ++   This program is distributed in the hope that it will be useful,
>> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> >> ++   GNU General Public License for more details.
>> >> ++
>> >> ++   You should have received a copy of the GNU General Public Licens=
e
>> >> ++   along with this program; if not, write to the Free Software
>> Foundation,
>> >> ++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
>> >> ++ USA.  */
>> >> ++
>> >> ++#include <config.h>
>> >> ++
>> >> ++#include "read-file.h"
>> >> ++
>> >> ++/* Get fstat.  */
>> >> ++#include <sys/stat.h>
>> >> ++
>> >> ++/* Get ftello.  */
>> >> ++#include <stdio.h>
>> >> ++
>> >> ++/* Get SIZE_MAX.  */
>> >> ++#include <stdint.h>
>> >> ++
>> >> ++/* Get malloc, realloc, free. */
>> >> ++#include <stdlib.h>
>> >> ++
>> >> ++/* Get errno. */
>> >> ++#include <errno.h>
>> >> ++
>> >> ++/* Read a STREAM and return a newly allocated string with the
>> content,
>> >> ++   and set *LENGTH to the length of the string.  The string is
>> >> ++   zero-terminated, but the terminating zero byte is not counted in
>> >> ++   *LENGTH.  On errors, *LENGTH is undefined, errno preserves the
>> >> ++   values set by system functions (if any), and NULL is returned.
>> >> ++*/ char * fread_file (FILE *stream, size_t *length) {
>> >> ++  char *buf =3D NULL;
>> >> ++  size_t alloc =3D BUFSIZ;
>> >> ++
>> >> ++  /* For a regular file, allocate a buffer that has exactly the
>> right
>> >> ++     size.  This avoids the need to do dynamic reallocations later.
>> >> ++ */  {
>> >> ++    struct stat st;
>> >> ++
>> >> ++    if (fstat (fileno (stream), &st) >=3D 0 && S_ISREG (st.st_mode)=
)
>> >> ++      {
>> >> ++        off_t pos =3D ftello (stream);
>> >> ++
>> >> ++        if (pos >=3D 0 && pos < st.st_size)
>> >> ++          {
>> >> ++            off_t alloc_off =3D st.st_size - pos;
>> >> ++
>> >> ++            /* '1' below, accounts for the trailing NUL.  */
>> >> ++            if (SIZE_MAX - 1 < alloc_off)
>> >> ++              {
>> >> ++                errno =3D ENOMEM;
>> >> ++                return NULL;
>> >> ++              }
>> >> ++
>> >> ++            alloc =3D alloc_off + 1;
>> >> ++          }
>> >> ++      }
>> >> ++  }
>> >> ++
>> >> ++  if (!(buf =3D malloc (alloc)))
>> >> ++    return NULL; /* errno is ENOMEM.  */
>> >> ++
>> >> ++  {
>> >> ++    size_t size =3D 0; /* number of bytes read so far */
>> >> ++    int save_errno;
>> >> ++
>> >> ++    for (;;)
>> >> ++      {
>> >> ++        /* This reads 1 more than the size of a regular file
>> >> ++           so that we get eof immediately.  */
>> >> ++        size_t requested =3D alloc - size;
>> >> ++        size_t count =3D fread (buf + size, 1, requested, stream);
>> >> ++        size +=3D count;
>> >> ++
>> >> ++        if (count !=3D requested)
>> >> ++          {
>> >> ++            save_errno =3D errno;
>> >> ++            if (ferror (stream))
>> >> ++              break;
>> >> ++
>> >> ++            /* Shrink the allocated memory if possible.  */
>> >> ++            if (size < alloc - 1)
>> >> ++              {
>> >> ++                char *smaller_buf =3D realloc (buf, size + 1);
>> >> ++                if (smaller_buf !=3D NULL)
>> >> ++                  buf =3D smaller_buf;
>> >> ++              }
>> >> ++
>> >> ++            buf[size] =3D '\0';
>> >> ++            *length =3D size;
>> >> ++            return buf;
>> >> ++          }
>> >> ++
>> >> ++        {
>> >> ++          char *new_buf;
>> >> ++
>> >> ++          if (alloc =3D=3D SIZE_MAX)
>> >> ++            {
>> >> ++              save_errno =3D ENOMEM;
>> >> ++              break;
>> >> ++            }
>> >> ++
>> >> ++          if (alloc < SIZE_MAX - alloc / 2)
>> >> ++            alloc =3D alloc + alloc / 2;
>> >> ++          else
>> >> ++            alloc =3D SIZE_MAX;
>> >> ++
>> >> ++          if (!(new_buf =3D realloc (buf, alloc)))
>> >> ++            {
>> >> ++              save_errno =3D errno;
>> >> ++              break;
>> >> ++            }
>> >> ++
>> >> ++          buf =3D new_buf;
>> >> ++        }
>> >> ++      }
>> >> ++
>> >> ++    free (buf);
>> >> ++    errno =3D save_errno;
>> >> ++    return NULL;
>> >> ++  }
>> >> ++}
>> >> ++
>> >> ++static char *
>> >> ++internal_read_file (const char *filename, size_t *length, const
>> >> ++char *mode) {
>> >> ++  FILE *stream =3D fopen (filename, mode);
>> >> ++  char *out;
>> >> ++  int save_errno;
>> >> ++
>> >> ++  if (!stream)
>> >> ++    return NULL;
>> >> ++
>> >> ++  out =3D fread_file (stream, length);
>> >> ++
>> >> ++  save_errno =3D errno;
>> >> ++
>> >> ++  if (fclose (stream) !=3D 0)
>> >> ++    {
>> >> ++      if (out)
>> >> ++        {
>> >> ++          save_errno =3D errno;
>> >> ++          free (out);
>> >> ++        }
>> >> ++      errno =3D save_errno;
>> >> ++      return NULL;
>> >> ++    }
>> >> ++
>> >> ++  return out;
>> >> ++}
>> >> ++
>> >> ++/* Open and read the contents of FILENAME, and return a newly
>> >> ++   allocated string with the content, and set *LENGTH to the length
>> of
>> >> ++   the string.  The string is zero-terminated, but the terminating
>> >> ++   zero byte is not counted in *LENGTH.  On errors, *LENGTH is
>> >> ++   undefined, errno preserves the values set by system functions (i=
f
>> >> ++   any), and NULL is returned.  */
>> >> ++char *
>> >> ++read_file (const char *filename, size_t *length) {
>> >> ++  return internal_read_file (filename, length, "r"); }
>> >> ++
>> >> ++/* Open (on non-POSIX systems, in binary mode) and read the content=
s
>> >> ++   of FILENAME, and return a newly allocated string with the conten=
t,
>> >> ++   and set LENGTH to the length of the string.  The string is
>> >> ++   zero-terminated, but the terminating zero byte is not counted in
>> >> ++   the LENGTH variable.  On errors, *LENGTH is undefined, errno
>> >> ++   preserves the values set by system functions (if any), and NULL
>> is
>> >> ++   returned.  */
>> >> ++char *
>> >> ++read_binary_file (const char *filename, size_t *length) {
>> >> ++  return internal_read_file (filename, length, "rb"); }
>> >> +
>> >> +diff --git a/lib/read-file.h b/lib/read-file.h index
>> >> +0000000..14041dc
>> >> +--- /dev/null
>> >> ++++ b/lib/read-file.h
>> >> +@@ -0,0 +1,36 @@
>> >> ++/* -*- buffer-read-only: t -*- vi: set ro: */
>> >> ++/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
>> >> ++/* read-file.h -- read file contents into a string
>> >> ++   Copyright (C) 2006, 2009-2011 Free Software Foundation, Inc.
>> >> ++   Written by Simon Josefsson.
>> >> ++
>> >> ++   This program is free software; you can redistribute it and/or
>> modify
>> >> ++   it under the terms of the GNU General Public License as publishe=
d
>> by
>> >> ++   the Free Software Foundation; either version 3, or (at your
>> option)
>> >> ++   any later version.
>> >> ++
>> >> ++   This program is distributed in the hope that it will be useful,
>> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> >> ++   GNU General Public License for more details.
>> >> ++
>> >> ++   You should have received a copy of the GNU General Public Licens=
e
>> >> ++   along with this program; if not, write to the Free Software
>> Foundation,
>> >> ++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
>> >> ++ USA.  */
>> >> ++
>> >> ++#ifndef READ_FILE_H
>> >> ++#define READ_FILE_H
>> >> ++
>> >> ++/* Get size_t.  */
>> >> ++#include <stddef.h>
>> >> ++
>> >> ++/* Get FILE.  */
>> >> ++#include <stdio.h>
>> >> ++
>> >> ++extern char *fread_file (FILE * stream, size_t * length);
>> >> ++
>> >> ++extern char *read_file (const char *filename, size_t * length);
>> >> ++
>> >> ++extern char *read_binary_file (const char *filename, size_t *
>> >> ++length);
>> >> ++
>> >> ++#endif /* READ_FILE_H */
>> >> +--
>> >> +1.7.9.7
>> >> +
>> >> diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>> >> b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>> >> index 761b2e6..74a9875 100644
>> >> --- a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>> >> +++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
>> >> @@ -22,6 +22,9 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-
>> ${PV}.tar.gz \
>> >>             file://fix-disable-ipv6.patch \
>> >>             file://disable-pre-ANSI-compilers.patch \
>> >>             file://remove_gets.patch \
>> >> +           file://add-readfile.patch \
>> >> +           file://15.patch \
>> >> +           file://add-module.patch \
>> >>  "
>> >>  SRC_URI[md5sum] =3D "ad8fdcdf1797b9ca258264a6b04e48fd"
>> >>  SRC_URI[sha256sum] =3D
>> "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"
>> > --
>> > Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group,
>> Wind River
>> > direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283=



