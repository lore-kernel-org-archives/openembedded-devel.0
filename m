Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IO90W-0007G3-HV
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 11:29:40 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 257E328C013; Thu, 23 Aug 2007 11:25:36 +0200 (CEST)
X-Spam-Flag: YES
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: *****
X-Spam-Status: Yes, score=5.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RCVD_IN_XBL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
X-Spam-Report: * -2.6 BAYES_00 BODY: Bayesian spam probability is 0 to 1%
	*      [score: 0.0000]
	* 2.0 RCVD_IN_SORBS_DUL RBL: SORBS: sent directly from dynamic IP
	address *      [85.180.189.163 listed in dnsbl.sorbs.net]
	*  3.9 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
	*      [85.180.189.163 listed in zen.spamhaus.org]
	*  1.9 RCVD_IN_NJABL_DUL RBL: NJABL: dialup sender did non-local SMTP
	*      [85.180.189.163 listed in combined.njabl.org]
	*  0.0 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
	*      [85.180.189.163 listed in zen.spamhaus.org]
	*  2.6 REPTO_OVERQUOTE_THEBAT The Bat! doesn't do quoting like this
	* -2.1 AWL AWL: From: address is in the auto white-list
Received: from PROMETHEUS (e180189163.adsl.alicedsl.de [85.180.189.163])
	by srv043.dedi23.de (Postfix) with ESMTP id 3C2D628C012;
	Thu, 23 Aug 2007 11:25:35 +0200 (CEST)
Date: Thu, 23 Aug 2007 11:28:30 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1292598113.20070823112830@vanille-media.de>
To: "pHilipp Zabel" <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30708230148y75af9399m1fbff6d46948bfdf@mail.gmail.com>
References: <74d0deb30708230148y75af9399m1fbff6d46948bfdf@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: dbus-glib-native: install dbus-binding-tool to ${STAGING_BINDIR}?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 09:29:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> Hi, I've got this change in my local workdir, unfortunately I don't
> remember what exactly needed the binding tool. Is this ok to commit?

> --- packages/dbus/dbus-glib-native_0.72.bb     
> 278c6e1074af019c5bf108638bebfba814ddc160
> +++ packages/dbus/dbus-glib-native_0.72.bb     
> 5c8a08a3c0bc93f2de4060d523738b5500cd88c0
> @@ -1,5 +1,5 @@ SECTION = "base"
>  SECTION = "base"
> -PR = "r0"
> +PR = "r1"
>  HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
>  DESCRIPTION = "message bus system for applications to talk to one another"
>  LICENSE = "GPL"
> @@ -19,4 +19,5 @@ do_stage() {
>          install -d ${STAGING_DATADIR}/dbus
>          install -m 0644 tools/dbus-bus-introspect.xml ${STAGING_DATADIR}/dbus
>          install -m 0644 tools/dbus-glib-bindings.h ${STAGING_DATADIR}/dbus
> +       install -m 0755 dbus/.libs/dbus-binding-tool ${STAGING_BINDIR}/
>  }

Does anything speak against using autotools_stage_all here?
I'd rather go away from handcoded do_stage() as much as possible.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



