Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 39C1F65D35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 06:31:56 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b84so153115802wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 23:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3W4kgdSdBVkzeJz9jeBq3xJ6BRW4JgrH5r3IyBSoES4=;
	b=GB9PaTsrrYXlfyzT9xW9Ezz0ESxcxdTOl0novtktf9LwKpuDzfsk5bzIHMBtL6tuF/
	zi3Uc/oB03sXE0Us/bESfQBHudtD6JYCkyrsQjj3B4Wzbge7zYtgVIjh7vMiz4D23SsB
	R9xdRJp9B/wneoBTJUOL0smRuQcHp+Evso+eWbljogikGk5/zcqWgmpiHg3XKs0jONxV
	41Vcj3GxlIeDmWOPsFCrotw9gickgNUT9SvN1zdgo9ncjBrBOX9ISgyjX13rcym6iZnZ
	0dExxlwE7h7v82JzcBR178UpAd8N19AbHvknYsgDH1hOnL/nVfYlJuiSKmAtSXWThxOZ
	NXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3W4kgdSdBVkzeJz9jeBq3xJ6BRW4JgrH5r3IyBSoES4=;
	b=nSjPxm8OMgYOl+cSEPHqPhSSYaVFf8/fRHvtvMkKdNKnQF8EZi1IzR9SrC4iwO3Aml
	kPvvwpMr9n/+hCK944e3Ol87Dw1HTtOm56q5NzPnYs98mgDk9BASM7u5kQIhmq5f3BpM
	ajynGoA+wsNUod57Dp3zeKWeqR/6f2uFXzApKRjJxH4CEvgQVS1qy24IU0Gz7mhyUqgk
	6uHnR2JMIWHWmK6fBVqXK/8UfrP9tRwCVsvsLWs2wA4lV7mQFvnwiQiL2wPl9JLH1GA3
	3E6VL8BPAO6MQUH5CYQaQCuRUipOK9dJq8WUu72FnbxdU+dfL3NM2xZ+I3mceTHVmZss
	f6/A==
X-Gm-Message-State: AODbwcBCwf+zpcCWGO0gr+Z6J3GsoesILcxfc73twWzvYFrEgqnSjoDU
	bInXsN9r+Lhv01O5VqV48QA3x9R/Rg==
X-Received: by 10.80.195.17 with SMTP id a17mr1745071edb.9.1495002717376; Tue,
	16 May 2017 23:31:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Tue, 16 May 2017 23:31:56 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B76F851@ALA-MBC.corp.ad.wrs.com>
References: <cover.1494572274.git.jackie.huang@windriver.com>
	<1740ba75071e18af3d95966ac84e8c959397b83e.1494572274.git.jackie.huang@windriver.com>
	<20170516143351.GD3088@jama>
	<1B858668EC6A94408DCA5225FDFA85AA014B76F851@ALA-MBC.corp.ad.wrs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 May 2017 08:31:56 +0200
Message-ID: <CA+chaQcrJqM2KhftxUgV-p-3X2M2Ptjwp1M6SrvUnzPNWOGtsw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/3] freediameter: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 May 2017 06:31:57 -0000
Content-Type: text/plain; charset="UTF-8"

Or you can Skip this recipe when ld-is-gold is used (with comment
explaining that it's because of lksctp-tools).

On Wed, May 17, 2017 at 3:06 AM, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

>
>
> > -----Original Message-----
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: Tuesday, May 16, 2017 22:34
> > To: Huang, Jie (Jackie)
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 2/3] freediameter: add new
> recipe
> >
> > On Fri, May 12, 2017 at 03:09:01PM +0800, jackie.huang@windriver.com
> wrote:
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > freeDiameter is an open source Diameter protocol
> > > implementation. It provides an extensible platform
> > > for deploying a Diameter network for your Authentication,
> > > Authorization and Accounting needs.
> >
> > lksctp-tools is blacklisted for builds with gold causing:
>
> Sorry I didn't build with gold so I didn't meet the issue, so I need to
> wait
> until lksctp-tools is fixed for builds with gold or I need to fix it
> myself, right?
>
> Thanks,
> Jackie
>
> >
> > ERROR: Nothing PROVIDES 'lksctp-tools' (but /home/jenkins/oe/world/shr-
> > core/meta-openembedded/meta-networking/recipes-
> > protocols/freediameter/freediameter_1.2.1.bb DEPENDS on or otherwise
> > requires it)
> > ERROR: lksctp-tools was skipped: Recipe is blacklisted: BROKEN: fails to
> link
> > against sctp_connectx symbol
> > ERROR: Nothing RPROVIDES 'freediameter' (but /home/jenkins/oe/world/shr-
> > core/meta-openembedded/meta-networking/recipes-
> > protocols/freediameter/freediameter_1.2.1.bb RDEPENDS on or otherwise
> > requires it)
> > ERROR: No eligible RPROVIDERs exist for 'freediameter'
> > NOTE: Runtime target 'freediameter' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['freediameter']
> > ERROR: Nothing RPROVIDES 'freediameter-dev' (but
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-
> > networking/recipes-protocols/freediameter/freediameter_1.2.1.bb RDEPENDS
> > on or otherwise requires it)
> > ERROR: No eligible RPROVIDERs exist for 'freediameter-dev'
> > NOTE: Runtime target 'freediameter-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['freediameter-dev']
> >
> > >
> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ---
> > >  ...murhash-algorithm-with-Robert-Jenkin-s-ha.patch | 223
> > +++++++++++++++++++++
> > >  .../freediameter/files/freediameter.init           |  72 +++++++
> > >  .../freediameter/files/freediameter.service        |  11 +
> > >  .../freediameter/files/install_test.patch          |  22 ++
> > >  .../freediameter/files/pass-ptest-env.patch        |  72 +++++++
> > >  .../recipes-protocols/freediameter/files/run-ptest |  11 +
> > >  .../freediameter/freediameter.inc                  |  98 +++++++++
> > >  .../freediameter/freediameter_1.2.1.bb             |   7 +
> > >  8 files changed, 516 insertions(+)
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/files/Replace-murmurhash-algorithm-with-Robert-
> > Jenkin-s-ha.patch
> > >  create mode 100755 meta-networking/recipes-
> > protocols/freediameter/files/freediameter.init
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/files/freediameter.service
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/files/install_test.patch
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/files/pass-ptest-env.patch
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/files/run-ptest
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/freediameter.inc
> > >  create mode 100644 meta-networking/recipes-
> > protocols/freediameter/freediameter_1.2.1.bb
> > >
> > > diff --git a/meta-networking/recipes-protocols/freediameter/files/
> Replace-
> > murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch b/meta-
> > networking/recipes-protocols/freediameter/files/Replace-murmurhash-
> > algorithm-with-Robert-Jenkin-s-ha.patch
> > > new file mode 100644
> > > index 000000000..71a5a1ae4
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-protocols/freediameter/files/Replace-
> > murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
> > > @@ -0,0 +1,223 @@
> > > +Replace murmurhash algorithm with Robert Jenkin's hash algorithm
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +From test result, murmurhash algorithm does not work in big endian
> > > +processor, so replace it with Robert Jenkin's hash which has worked
> > > +in linux kernel for many years and has more adaptability.
> > > +
> > > +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> > > +---
> > > + libfdproto/ostr.c |  192 +++++++++++++++++++++---------
> -----------------------
> > > + 1 file changed, 74 insertions(+), 118 deletions(-)
> > > +
> > > +diff --git a/libfdproto/ostr.c b/libfdproto/ostr.c
> > > +index 8f29b48..ce1f4dd 100644
> > > +--- a/libfdproto/ostr.c
> > > ++++ b/libfdproto/ostr.c
> > > +@@ -430,128 +430,84 @@ after_proto:
> > > +
> > > +
> > > +
> > /****************************************************************
> > ****************************************/
> > > +-/* Hash function -- credits to Austin Appleby, thank you ^^ */
> > > +-/* See http://murmurhash.googlepages.com for more information on
> this
> > function */
> > > +-
> > > +-/* the strings are NOT always aligned properly (ex: received in
> RADIUS
> > message), so we use the aligned MurmurHash2 function as needed */
> > > +-#define _HASH_MIX(h,k,m) { k *= m; k ^= k >> r; k *= m; h *= m; h ^=
> k; }
> > > +-uint32_t fd_os_hash ( uint8_t * string, size_t len )
> > > ++/*
> > > ++ * Robert Jenkin's hash function.
> > > ++ * http://burtleburtle.net/bob/hash/evahash.html
> > > ++ * This is in the public domain.
> > > ++ */
> > > ++#define mix(a, b, c)                                              \
> > > ++  do {                                                    \
> > > ++          a = a - b;  a = a - c;  a = a ^ (c >> 13);      \
> > > ++          b = b - c;  b = b - a;  b = b ^ (a << 8);       \
> > > ++          c = c - a;  c = c - b;  c = c ^ (b >> 13);      \
> > > ++          a = a - b;  a = a - c;  a = a ^ (c >> 12);      \
> > > ++          b = b - c;  b = b - a;  b = b ^ (a << 16);      \
> > > ++          c = c - a;  c = c - b;  c = c ^ (b >> 5);       \
> > > ++          a = a - b;  a = a - c;  a = a ^ (c >> 3);       \
> > > ++          b = b - c;  b = b - a;  b = b ^ (a << 10);      \
> > > ++          c = c - a;  c = c - b;  c = c ^ (b >> 15);      \
> > > ++  } while (0)
> > > ++
> > > ++unsigned hash_rjenkins(const char *str, unsigned length)
> > > + {
> > > +-  uint32_t hash = len;
> > > +-  uint8_t * data = string;
> > > +-
> > > +-  const unsigned int m = 0x5bd1e995;
> > > +-  const int r = 24;
> > > +-  int align = (long)string & 3;
> > > +-
> > > +-  if (!align || (len < 4)) {
> > > +-          /* In case data is aligned, MurmurHash2 function */
> > > +-          while(len >= 4)
> > > +-          {
> > > +-                  /* Mix 4 bytes at a time into the hash */
> > > +-                  uint32_t k = *(uint32_t *)data; /* We don't care
> > about the byte order */
> > > +-
> > > +-                  _HASH_MIX(hash, k, m);
> > > +-
> > > +-                  data += 4;
> > > +-                  len -= 4;
> > > +-          }
> > > +-
> > > +-          /* Handle the last few bytes of the input */
> > > +-          switch(len) {
> > > +-                  case 3: hash ^= data[2] << 16;
> > > +-                  case 2: hash ^= data[1] << 8;
> > > +-                  case 1: hash ^= data[0];
> > > +-                          hash *= m;
> > > +-          }
> > > +-
> > > +-  } else {
> > > +-          /* Unaligned data, use alignment-safe slower version */
> > > +-
> > > +-          /* Pre-load the temp registers */
> > > +-          uint32_t t = 0, d = 0;
> > > +-          switch(align)
> > > +-          {
> > > +-                  case 1: t |= data[2] << 16;
> > > +-                  case 2: t |= data[1] << 8;
> > > +-                  case 3: t |= data[0];
> > > +-          }
> > > +-          t <<= (8 * align);
> > > +-
> > > +-          data += 4-align;
> > > +-          len -= 4-align;
> > > +-
> > > +-          /* From this point, "data" can be read by chunks of 4
> bytes */
> > > +-
> > > +-          int sl = 8 * (4-align);
> > > +-          int sr = 8 * align;
> > > +-
> > > +-          /* Mix */
> > > +-          while(len >= 4)
> > > +-          {
> > > +-                  uint32_t k;
> > > +-
> > > +-                  d = *(unsigned int *)data;
> > > +-                  k = (t >> sr) | (d << sl);
> > > +-
> > > +-                  _HASH_MIX(hash, k, m);
> > > +-
> > > +-                  t = d;
> > > +-
> > > +-                  data += 4;
> > > +-                  len -= 4;
> > > +-          }
> > > +-
> > > +-          /* Handle leftover data in temp registers */
> > > +-          d = 0;
> > > +-          if(len >= align)
> > > +-          {
> > > +-                  uint32_t k;
> > > +-
> > > +-                  switch(align)
> > > +-                  {
> > > +-                  case 3: d |= data[2] << 16;
> > > +-                  case 2: d |= data[1] << 8;
> > > +-                  case 1: d |= data[0];
> > > +-                  }
> > > +-
> > > +-                  k = (t >> sr) | (d << sl);
> > > +-                  _HASH_MIX(hash, k, m);
> > > +-
> > > +-                  data += align;
> > > +-                  len -= align;
> > > +-
> > > +-                  /* Handle tail bytes */
> > > +-
> > > +-                  switch(len)
> > > +-                  {
> > > +-                  case 3: hash ^= data[2] << 16;
> > > +-                  case 2: hash ^= data[1] << 8;
> > > +-                  case 1: hash ^= data[0];
> > > +-                                  hash *= m;
> > > +-                  };
> > > +-          }
> > > +-          else
> > > +-          {
> > > +-                  switch(len)
> > > +-                  {
> > > +-                  case 3: d |= data[2] << 16;
> > > +-                  case 2: d |= data[1] << 8;
> > > +-                  case 1: d |= data[0];
> > > +-                  case 0: hash ^= (t >> sr) | (d << sl);
> > > +-                                  hash *= m;
> > > +-                  }
> > > +-          }
> > > +-
> > > ++  const unsigned char *k = (const unsigned char *)str;
> > > ++  uint32_t a, b, c;  /* the internal state */
> > > ++  uint32_t len;      /* how many key bytes still need mixing */
> > > ++
> > > ++  /* Set up the internal state */
> > > ++  len = length;
> > > ++  a = 0x9e3779b9;      /* the golden ratio; an arbitrary value */
> > > ++  b = a;
> > > ++  c = 0;               /* variable initialization of internal state
> */
> > > ++
> > > ++  /* handle most of the key */
> > > ++  while (len >= 12) {
> > > ++          a = a + (k[0] + ((uint32_t)k[1] << 8) + ((uint32_t)k[2] <<
> 16) +
> > > ++                   ((uint32_t)k[3] << 24));
> > > ++          b = b + (k[4] + ((uint32_t)k[5] << 8) + ((uint32_t)k[6] <<
> 16) +
> > > ++                   ((uint32_t)k[7] << 24));
> > > ++          c = c + (k[8] + ((uint32_t)k[9] << 8) + ((uint32_t)k[10]
> << 16) +
> > > ++                   ((uint32_t)k[11] << 24));
> > > ++          mix(a, b, c);
> > > ++          k = k + 12;
> > > ++          len = len - 12;
> > > ++  }
> > > +
> > > ++  /* handle the last 11 bytes */
> > > ++  c = c + length;
> > > ++  switch (len) {            /* all the case statements fall through
> */
> > > ++  case 11:
> > > ++          c = c + ((uint32_t)k[10] << 24);
> > > ++  case 10:
> > > ++          c = c + ((uint32_t)k[9] << 16);
> > > ++  case 9:
> > > ++          c = c + ((uint32_t)k[8] << 8);
> > > ++          /* the first byte of c is reserved for the length */
> > > ++  case 8:
> > > ++          b = b + ((uint32_t)k[7] << 24);
> > > ++  case 7:
> > > ++          b = b + ((uint32_t)k[6] << 16);
> > > ++  case 6:
> > > ++          b = b + ((uint32_t)k[5] << 8);
> > > ++  case 5:
> > > ++          b = b + k[4];
> > > ++  case 4:
> > > ++          a = a + ((uint32_t)k[3] << 24);
> > > ++  case 3:
> > > ++          a = a + ((uint32_t)k[2] << 16);
> > > ++  case 2:
> > > ++          a = a + ((uint32_t)k[1] << 8);
> > > ++  case 1:
> > > ++          a = a + k[0];
> > > ++          /* case 0: nothing left to add */
> > > +   }
> > > ++  mix(a, b, c);
> > > +
> > > +-  /* Do a few final mixes of the hash to ensure the last few
> > > +-     bytes are well-incorporated. */
> > > +-  hash ^= hash >> 13;
> > > +-  hash *= m;
> > > +-  hash ^= hash >> 15;
> > > ++  return c;
> > > ++}
> > > +
> > > +-  return hash;
> > > ++uint32_t fd_os_hash ( uint8_t * string, size_t len )
> > > ++{
> > > ++  return hash_rjenkins(string, len);
> > > + }
> > > +
> > > +--
> > > +1.7.10.4
> > > +
> > > diff --git a/meta-networking/recipes-
> > protocols/freediameter/files/freediameter.init
> b/meta-networking/recipes-
> > protocols/freediameter/files/freediameter.init
> > > new file mode 100755
> > > index 000000000..e63a42a7c
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-
> > protocols/freediameter/files/freediameter.init
> > > @@ -0,0 +1,72 @@
> > > +#!/bin/sh
> > > +#
> > > +### BEGIN INIT INFO
> > > +# Provides:          freediameter
> > > +# Default-Start:     2 3 4 5
> > > +# Default-Stop:      0 1 6
> > > +# Required-Start:    $remote_fs $syslog
> > > +# Required-Stop:     $remote_fs $syslog
> > > +# Short-Description: Start freeDiameter daemon at boot time
> > > +# Description:       Start the freeDiameter daemon at boot time.
> > > +#       freeDiameter is an extensible implementation of the Diameter
> protocol,
> > > +#       designed for Authentication, Authorization and Accounting.
> Diameter is
> > > +#       an evolution of the RADIUS protocol.
> > > +### END INIT INFO#
> > > +DAEMON=/usr/bin/freeDiameterd
> > > +CONF=/etc/freeDiameter/freeDiameter.conf
> > > +NAME=freediameter
> > > +DESC="freeDiameter daemon"
> > > +
> > > +. /etc/init.d/functions
> > > +start() {
> > > +   [ -x $DAEMON ] || exit 5
> > > +   echo -n $"Starting $DAEMON: "
> > > +   start-stop-daemon -S -b -x ${DAEMON} && success || failure
> > > +   retval=$?
> > > +   echo ""
> > > +   return $retval
> > > +}
> > > +
> > > +stop() {
> > > +   echo -n $"Stopping $prog: "
> > > +   start-stop-daemon -K -x $DAEMON
> > > +   retval=$?
> > > +   echo ""
> > > +   return $retval
> > > +}
> > > +
> > > +restart() {
> > > +   stop
> > > +   sleep 3
> > > +   start
> > > +}
> > > +
> > > +rh_status() {
> > > +   status $DAEMON
> > > +}
> > > +
> > > +rh_status_q() {
> > > +   rh_status > /dev/null 2>&1
> > > +}
> > > +
> > > +case "$1" in
> > > +  start)
> > > +   rh_status_q && exit 0
> > > +   start
> > > +   ;;
> > > +  stop)
> > > +   rh_status_q || exit 0
> > > +   stop
> > > +   ;;
> > > +  restart)
> > > +   restart
> > > +   ;;
> > > +  status)
> > > +   rh_status
> > > +   ;;
> > > +  *)
> > > +   echo $"Usage: $prog {start|stop|status|restart}"
> > > +   exit 2
> > > +esac
> > > +
> > > +exit $?
> > > diff --git a/meta-networking/recipes-
> > protocols/freediameter/files/freediameter.service
> b/meta-networking/recipes-
> > protocols/freediameter/files/freediameter.service
> > > new file mode 100644
> > > index 000000000..514481b43
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-
> > protocols/freediameter/files/freediameter.service
> > > @@ -0,0 +1,11 @@
> > > +[Unit]
> > > +Description=freediameter daemon
> > > +After=network.target
> > > +
> > > +[Service]
> > > +Type=simple
> > > +PIDFile=/var/run/freediameter.pid
> > > +ExecStart=@BINDIR@/freeDiameterd
> > > +
> > > +[Install]
> > > +WantedBy=multi-user.target
> > > diff --git a/meta-networking/recipes-
> > protocols/freediameter/files/install_test.patch
> b/meta-networking/recipes-
> > protocols/freediameter/files/install_test.patch
> > > new file mode 100644
> > > index 000000000..151037d69
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-
> > protocols/freediameter/files/install_test.patch
> > > @@ -0,0 +1,22 @@
> > > +CMakeLists: add an option to install tests
> > > +
> > > +Upstream-Status: Inappropriate [OE ptest specific]
> > > +
> > > +Original author: Yao Zhao <yao.zhao@windriver.com>
> > > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > +
> > > +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> > > +index da8da1b..de04059 100644
> > > +--- a/tests/CMakeLists.txt
> > > ++++ b/tests/CMakeLists.txt
> > > +@@ -113,4 +113,9 @@ ENDFOREACH( TEST )
> > > + ####
> > > + ## INSTALL section ##
> > > +
> > > +-# we do not install the tests
> > > ++# install the tests
> > > ++SET(INSTALL_TEST_SUFFIX       /opt/${FD_PROJECT_NAME}-tests   CACHE
> > PATH "Directory where the test binary is installed.")
> > > ++
> > > ++INSTALL(TARGETS ${TEST_LIST}
> > > ++        RUNTIME DESTINATION ${INSTALL_TEST_SUFFIX}
> > > ++        COMPONENT freeDiameter-common)
> > > diff --git a/meta-networking/recipes-protocols/freediameter/files/
> pass-ptest-
> > env.patch b/meta-networking/recipes-protocols/freediameter/files/
> pass-ptest-
> > env.patch
> > > new file mode 100644
> > > index 000000000..ea857af7d
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-protocols/freediameter/files/pass-ptest-
> > env.patch
> > > @@ -0,0 +1,72 @@
> > > +freediameter ptest cases testmesg_stress.c and testloadext.c need load
> > > +extensions both build time and runtime. Then they search extensions
> with
> > > +build directory that causes runtime failures.
> > > +
> > > +Pass an environment variable to define runtime extension path.
> > > +
> > > +Upstream-Status: Inappropriate [OE ptest specific]
> > > +
> > > +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > +
> > > +diff -Nur freeDiameter-1.2.0.orig/tests/testloadext.c freeDiameter-
> > 1.2.0/tests/testloadext.c
> > > +--- freeDiameter-1.2.0.orig/tests/testloadext.c    2014-02-19
> > 17:33:24.785405032 +0800
> > > ++++ freeDiameter-1.2.0/tests/testloadext.c 2014-02-19
> > 20:08:03.871403924 +0800
> > > +@@ -49,7 +49,7 @@
> > > + {
> > > +   DIR *dir;
> > > +   struct dirent *dp;
> > > +-  char fullname[512];
> > > ++  char fullname[1024];
> > > +   int pathlen;
> > > +
> > > +   /* First, initialize the daemon modules */
> > > +@@ -57,11 +57,16 @@
> > > +   CHECK( 0, fd_queues_init()  );
> > > +   CHECK( 0, fd_msg_init()  );
> > > +   CHECK( 0, fd_rtdisp_init()  );
> > > +-
> > > ++
> > > ++  char *ext_dir = getenv("EXTENSIONS_DIR");
> > > ++  if (ext_dir)
> > > ++          pathlen = snprintf(fullname, sizeof(fullname), "%s",
> ext_dir);
> > > ++  else
> > > ++          pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> > "/extensions/");
> > > ++
> > > +   /* Find all extensions which have been compiled along the test */
> > > +-  TRACE_DEBUG(INFO, "Loading from: '%s'", BUILD_DIR "/extensions");
> > > +-  CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 :
> 0 );
> > > +-  pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> "/extensions/");
> > > ++  TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
> > > ++  CHECK( 0, (dir = opendir (fullname)) == NULL ? 1 : 0 );
> > > +
> > > +   while ((dp = readdir (dir)) != NULL) {
> > > +           char * dot = strrchr(dp->d_name, '.');
> > > +diff -Nur freeDiameter-1.2.0.orig/tests/testmesg_stress.c
> freeDiameter-
> > 1.2.0/tests/testmesg_stress.c
> > > +--- freeDiameter-1.2.0.orig/tests/testmesg_stress.c        2014-02-19
> > 17:33:24.785405032 +0800
> > > ++++ freeDiameter-1.2.0/tests/testmesg_stress.c     2014-02-19
> > 20:08:03.928403924 +0800
> > > +@@ -67,15 +67,20 @@
> > > + {
> > > +   DIR *dir;
> > > +   struct dirent *dp;
> > > +-  char fullname[512];
> > > ++  char fullname[1024];
> > > +   int pathlen;
> > > +   struct fd_list all_extensions = FD_LIST_INITIALIZER(all_
> extensions);
> > > +   struct fd_list ext_with_depends =
> > FD_LIST_INITIALIZER(ext_with_depends);
> > > +
> > > ++  char *ext_dir = getenv("EXTENSIONS_DIR");
> > > ++  if (ext_dir)
> > > ++          pathlen = snprintf(fullname, sizeof(fullname), "%s",
> ext_dir);
> > > ++  else
> > > ++          pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> > "/extensions/");
> > > ++
> > > +   /* Find all extensions which have been compiled along the test */
> > > +-  LOG_D("Loading %s*.fdx from: '%s'", BUILD_DIR "/extensions",
> prefix ?:
> > "");
> > > +-  CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 :
> 0 );
> > > +-  pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR
> "/extensions/");
> > > ++  TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
> > > ++  CHECK( 0, (dir = opendir (fullname)) == NULL ? 1 : 0 );
> > > +
> > > +   while ((dp = readdir (dir)) != NULL) {
> > > +           char * dot = strrchr(dp->d_name, '.');
> > > diff --git a/meta-networking/recipes-protocols/freediameter/files/
> run-ptest
> > b/meta-networking/recipes-protocols/freediameter/files/run-ptest
> > > new file mode 100644
> > > index 000000000..d0ca8d962
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
> > > @@ -0,0 +1,11 @@
> > > +#!/bin/sh
> > > +
> > > +if ! lsmod | grep -q sctp && ! modprobe sctp 2>/dev/null; then
> > > +        echo "Couldn't load kernel module sctp."
> > > +        echo "Test cases testsctp and testcnx will fail."
> > > +        echo
> > > +fi
> > > +
> > > +export EXTENSIONS_DIR=$EXTENSIONS_DIR
> > > +cmake  -E cmake_echo_color --cyan "Running tests..."
> > > +ctest --force-new-ctest-process
> > > diff --git a/meta-networking/recipes-protocols/freediameter/
> freediameter.inc
> > b/meta-networking/recipes-protocols/freediameter/freediameter.inc
> > > new file mode 100644
> > > index 000000000..6880d26f2
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-protocols/freediameter/freediameter.inc
> > > @@ -0,0 +1,98 @@
> > > +SUMMARY = "An open source implementation of the diameter protocol"
> > > +DESCRIPTION = "\
> > > +freeDiameter is an open source Diameter protocol implementation. It \
> > > +provides an extensible platform for deploying a Diameter network for \
> > > +your Authentication, Authorization and Accounting needs."
> > > +
> > > +HOMEPAGE = "http://www.freediameter.net"
> > > +
> > > +DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn
> lksctp-tools"
> > > +
> > > +pkgname = "freeDiameter"
> > > +
> > > +SRC_URI =
> > "http://www.freediameter.net/hg/${pkgname}/archive/${PV}.
> tar.gz;downloadfi
> > lename=${pkgname}-${PV}.tar.gz \
> > > +           file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
> \
> > > +           file://freediameter.service \
> > > +           file://freediameter.init \
> > > +           \
> > > +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
> > > +           'file://install_test.patch \
> > > +            file://run-ptest \
> > > +            file://pass-ptest-env.patch', '', d)} \
> > > +           "
> > > +
> > > +S = "${WORKDIR}/${pkgname}-${PV}"
> > > +
> > > +PTEST_PATH = "${libdir}/${pkgname}/ptest"
> > > +
> > > +inherit cmake update-rc.d ptest systemd
> > > +
> > > +EXTRA_OECMAKE = " \
> > > +    -DDEFAULT_CONF_PATH:PATH=${sysconfdir}/${pkgname} \
> > > +    -DBUILD_DBG_MONITOR:BOOL=ON  \
> > > +    -DBUILD_TEST_APP:BOOL=ON \
> > > +    -DBUILD_TESTING:BOOL=ON \
> > > +    -DBUILD_APP_RADGW:BOOL=ON \
> > > +    -DBUILD_APP_REDIRECT:BOOL=ON \
> > > +    -DBUILD_TEST_ACCT:BOOL=ON \
> > > +    -DBUILD_TEST_NETEMUL:BOOL=ON \
> > > +    -DBUILD_TEST_RT_ANY:BOOL=ON \
> > > +    -DINSTALL_LIBRARY_SUFFIX:PATH=${baselib} \
> > > +    -DINSTALL_EXTENSIONS_SUFFIX:PATH=${baselib}/${pkgname} \
> > > +    -DINSTALL_TEST_SUFFIX:PATH=${PTEST_PATH}-tests \
> > > +    -DCMAKE_SKIP_RPATH:BOOL=ON \
> > > +"
> > > +# INSTALL_LIBRARY_SUFFIX is relative to CMAKE_INSTALL_PREFIX
> > > +# specify it on cmd line will fix the SET bug in CMakeList.txt
> > > +
> > > +# -DBUILD_APP_ACCT:BOOL=ON This needs POSTGRESQL support
> > > +
> > > +# -DBUILD_APP_DIAMEAP:BOOL=ON  -DBUILD_APP_SIP:BOOL=ON -
> > DBUILD_TEST_SIP:BOOL=ON
> > > +# These need MySQL support
> > > +
> > > +# -DBUILD_DBG_INTERACTIVE:BOOL=ON This needs SWIG support
> > > +
> > > +# -DALL_EXTENSIONS=ON will enable all
> > > +
> > > +do_install_append() {
> > > +    # install the sample configuration file
> > > +    install -d -m 0755 ${D}${sysconfdir}/${pkgname}
> > > +    for i in ${S}/doc/*.conf.sample; do
> > > +        install -m 0644 $i ${D}${sysconfdir}/${pkgname}/
> > > +    done
> > > +    mv ${D}${sysconfdir}/${pkgname}/freediameter.conf.sample \
> > > +      ${D}${sysconfdir}/${pkgname}/freeDiameter.conf.sample
> > > +
> > > +    # install daemon init related files
> > > +    install -d -m 0755 ${D}${sysconfdir}/default
> > > +    install -d -m 0755 ${D}${sysconfdir}/init.d
> > > +    install -m 0644 ${S}/contrib/debian/freediameter-daemon.default \
> > > +      ${D}${sysconfdir}/default/${BPN}
> > > +    install -m 0755 ${WORKDIR}/freediameter.init
> > ${D}${sysconfdir}/init.d/${BPN}
> > > +
> > > +    # install for systemd
> > > +    install -d ${D}${systemd_system_unitdir}
> > > +    install -m 0644 ${WORKDIR}/freediameter.service
> > ${D}${systemd_system_unitdir}
> > > +    sed -i -e 's,@BINDIR@,${bindir},g'
> > ${D}${systemd_system_unitdir}/*.service
> > > +}
> > > +
> > > +do_install_ptest() {
> > > +    sed -i "s#\(EXTENSIONS_DIR=\).*\$#\1${libdir}/${pkgname}/#"
> > ${D}${PTEST_PATH}/run-ptest
> > > +    mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
> > > +    rmdir ${D}${PTEST_PATH}-tests
> > > +    install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}/
> > > +}
> > > +
> > > +FILES_${PN}-dbg += "${libdir}/${pkgname}/.debug/*"
> > > +
> > > +# include the extensions in main package
> > > +FILES_${PN} += "${libdir}/${pkgname}/*"
> > > +
> > > +RDEPENDS_${PN} = "glib-2.0 gnutls libidn"
> > > +RDEPENDS_${PN}-ptest = "cmake"
> > > +
> > > +INITSCRIPT_NAME = "${BPN}"
> > > +INITSCRIPT_PARAMS = "start 30 . stop 70 0 1 2 3 4 5 6 ."
> > > +
> > > +SYSTEMD_SERVICE_${PN} = "freediameter.service"
> > > +SYSTEMD_AUTO_ENABLE = "disable"
> > > diff --git a/meta-networking/recipes-
> > protocols/freediameter/freediameter_1.2.1.bb b/meta-networking/recipes-
> > protocols/freediameter/freediameter_1.2.1.bb
> > > new file mode 100644
> > > index 000000000..3fb929aa0
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-
> > protocols/freediameter/freediameter_1.2.1.bb
> > > @@ -0,0 +1,7 @@
> > > +include freediameter.inc
> > > +
> > > +LICENSE = "BSD"
> > > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=892b2ed6ae815488a08416ff7ee74a35"
> > > +
> > > +SRC_URI[md5sum] = "61b1062aa144b5f12eed514611e6d697"
> > > +SRC_URI[sha256sum] =
> > "bd7f105542e9903e776aa006c6931c1f5d3d477cb59af33a9162422efa477097"
> > > --
> > > 2.11.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

