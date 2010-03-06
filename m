Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NnvVi-0002a4-Df
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 16:01:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o26EwqJA029835
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 6 Mar 2010 14:58:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29452-08 for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Mar 2010 14:58:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o26Ewgip029829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 6 Mar 2010 14:58:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <F5DBF875-2CE0-4218-A2FD-45E83EE3AADD@vanille-media.de>
References: <87hbou4x8f.fsf@SSpaeth.de>
	<F5DBF875-2CE0-4218-A2FD-45E83EE3AADD@vanille-media.de>
Date: Sat, 06 Mar 2010 06:58:40 -0800
Message-ID: <1267887520.11175.17.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Convert vala to new world staging
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
X-List-Received-Date: Sat, 06 Mar 2010 15:01:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-03-05 at 17:56 +0100, Dr. Michael Lauer wrote:
> > All vala recipes currently complain about being lagacy stages. With a
> > lot of help from my friends I came up with this patch for
> > classes/vala.bbclass.
> > 
> > diff --git a/classes/vala.bbclass b/classes/vala.bbclass
> > index 2633905..2c23efb 100644
> > --- a/classes/vala.bbclass
> > +++ b/classes/vala.bbclass
> > @@ -9,8 +9,8 @@ VALA_DONT_STAGE_VAPIS ?= "\(/config.vapi$\)\|\(/config.deps$\)"
> > 
> > # .vapi and .deps files are arch independent and need to be present in the
> > # staging datadir for the native vala compiler
> > -do_stage_append() {
> > -	install -d ${STAGING_DATADIR_NATIVE}/vala/vapi
> > -	for VALAFILE in `find . -name "*.vapi" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${STAGING_DATADIR_NATIVE}/vala/vapi/; done
> > -	for VALAFILE in `find . -name "*.deps" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${STAGING_DATADIR_NATIVE}/vala/vapi/; done
> > +do_install_append() {
> > +	install -d ${D}${datadir}/vala/vapi
> > +	for VALAFILE in `find . -name "*.vapi" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${D}${datadir}/vala/vapi/; done
> > +	for VALAFILE in `find . -name "*.deps" | grep -v "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE} ${D}${datadir}/vala/vapi/; done
> > }
> 
> This will only work for vala-native. All non-native packages inheriting vala will then fail to install their
> .vapi files in STAGING_DATADIR_NATIVE, which is where vala-native expects them to be.

Something is very wrong with vala-native then :(

Target packages should not be installing things into the native sysroot.
The reason why is when we come to start using staging packages, these
staging packages are going to have a dependency on the specific build
system they were built on.

If these files are architecture independent I'd suggest putting them in
an architecture independent path (which native sysroot is not)

Cheers,

Richard



