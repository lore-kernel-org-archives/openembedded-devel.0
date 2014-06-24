Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1ED265F15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 07:03:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5O73Bml022452 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 08:03:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kOfHHo69ayhO
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 08:03:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5O736Z2022437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 08:03:08 +0100
Message-ID: <1403593380.2104.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jun 2014 08:03:00 +0100
In-Reply-To: <20140623235859.GK2437@jama>
References: <1403553432.2104.112.camel@ted> <20140623235859.GK2437@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] eject: Fix B != S builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jun 2014 07:03:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-24 at 01:58 +0200, Martin Jansa wrote:
> On Mon, Jun 23, 2014 at 08:57:12PM +0100, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > index 9534577..6cb31a7 100644
> > --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > @@ -9,6 +9,11 @@ SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
> >             file://eject-2.1.5-error-return.patch \
> >  "
> >  
> > +do_compile_prepend () {
> > +    mkdir -p ${B}/po
> > +    cp -r ${S}/po/* ${B}/po/
> > +}
> 
> Wasn't this fixed already? I've seen it in your big patch, but the same
> logic is applied in newer master already.

Yes, that has merged, sorry.

Cheers,

Richard


