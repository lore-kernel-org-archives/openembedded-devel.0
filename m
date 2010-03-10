Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NpSL6-00040p-13
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 21:17:12 +0100
Received: by qyk8 with SMTP id 8so6588314qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1RrhiIoMNFsmeK1lgKdqWMn6zxyjraCk82NFfLWKBHU=;
	b=U7KHkkSWSToMa4wg/jtvxlu0bPoVFQE3Lq7OUJK50hEjpYXT7GMqhmwtcbpTGYsm29
	s+j+q7MSuySaK/sWLc4Atgiv58fkpbOzpx4j2nQL4wNYRqeOXhYchu9e+b/xlRcxkDSQ
	GWowtTZ8c2dHsCeOSuy0Y0OS6IdDlMTSmoA38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WT4FwTIpKYCf/wfh0CBHARtvmJIIRZo57M2OcIjd11hfDedAWzCKYoTWuIc/jyUyiG
	SJPcwFtBuFfvIgrw1mF9UM8vD2IYtqFclIE3uD+hONyO43yrkVTOQcBFpMbHA653ull4
	u2fmIzvD9bV9z4Q4HGJjmGmeL/q5yIOxQFBjs=
MIME-Version: 1.0
Received: by 10.229.88.19 with SMTP id y19mr147162qcl.46.1268252049655; Wed, 
	10 Mar 2010 12:14:09 -0800 (PST)
In-Reply-To: <1268247148.14566.1079.camel@mill.internal.reciva.com>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
	<1267888617.11175.42.camel@rex> <20100309181656.GA19931@denix.org>
	<1268159056.5437.2018.camel@lenovo.internal.reciva.com>
	<5e088bd91003100922t9b6668fl577fdbafae53c82@mail.gmail.com>
	<1268247148.14566.1079.camel@mill.internal.reciva.com>
Date: Wed, 10 Mar 2010 12:14:09 -0800
Message-ID: <5e088bd91003101214y53a1d0b2h3bd47f2865e66b74@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Wed, 10 Mar 2010 20:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2010 at 10:52 AM, Phil Blundell <pb@reciva.com> wrote:
> On Wed, 2010-03-10 at 09:22 -0800, Steve Sakoman wrote:
>> So for me it seems to have triggered the problem it was trying to fix!
>
> Doh. =A0That's not so good.
>
> Please try the patch at http://pastebin.ca/1832243 and see if the
> situation improves for you.

Sorry, I get the same error:

| Making all in demos
| make[2]: Entering directory
`/home/sakoman/source/omap3-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gtk+-=
2.18.6-r8.3/gtk+-2.18.6/demos'
| /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/bin/gdk-pixbuf-c=
source
--raw --build-list		\
| 	        apple_red  ./apple-red.png	\
|                 gnome_foot ./gnome-foot.png	\
|         > test-inline-pixbufs.h				\
| 	|| (rm -f test-inline-pixbufs.h && false)
|
| (process:22315): GdkPixbuf-WARNING **: Cannot open pixbuf loader
module file '/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/etc/gtk-2=
.0/gdk-pixbuf.loaders':
No such file or directory
| failed to load "./apple-red.png": Couldn't recognize the image file
format for file './apple-red.png'
| make[2]: *** [test-inline-pixbufs.h] Error 1

Steve


