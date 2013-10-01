Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 259A4610FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 11:38:55 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so5738201lbh.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 04:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0rOzBVAIG7NGUW6hfr/y9KmM5fkfCXm+J+YPXw6yz4E=;
	b=Lb3DtiqgytS95pQl4fK5Q4S27nxN77FKBt4ZsvfdPmUVfx84d7mVEggrTWYlLUk/Az
	kO+fFd4KZBOpVb79fGixomOjZPVjcTRaWbJZOeG04D4goMUSD+61YhYk4o0Vx3mUCg8/
	RdULZCaTvN5JDUAYcIhI6Hl9qvTPXmX/RLzRlHhFuuxv1EzJ7EHVg9Wdn02ztEyuUkms
	qVsXRiP8MKZgQ6fbiwp3AOOO7+a3PezHrGeU02vPHgEvHVssIa5OBRP/SNipya4m8MU6
	veudEgu8Lzry+319Q58eDe9pE4GjLEoDJfedbcC5DqHnutKu1scdHuLrq/UhhATnOKCW
	5A/w==
X-Gm-Message-State: ALoCoQnwPOzrQFPC7QLO6KnMauZPMGOrqM2GPXQPUsGrzFHlBO3dzh3eLo+oFEKcetG5Ls5ebtMi
MIME-Version: 1.0
X-Received: by 10.152.28.7 with SMTP id x7mr24565838lag.26.1380627536814; Tue,
	01 Oct 2013 04:38:56 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Tue, 1 Oct 2013 04:38:56 -0700 (PDT)
In-Reply-To: <CAJTo0Lb7+Kdzg-M6N=j0rb0CRAXZ1OWbCrxAkzNXGafWK9Fc+A@mail.gmail.com>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
	<00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
	<CAJTo0Lb7+Kdzg-M6N=j0rb0CRAXZ1OWbCrxAkzNXGafWK9Fc+A@mail.gmail.com>
Date: Tue, 1 Oct 2013 13:38:56 +0200
Message-ID: <CAKS01o=pE_6PiWyk=Xct8ias3xFQ+X2CtLufLGsNeAXgj_wTkg@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: unable to compile eglibc_2.18
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
X-List-Received-Date: Tue, 01 Oct 2013 11:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you Ross,
but i already tried that..

I get the following error
ERROR: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager
(sysvinit) matches the entries enabled in DISTRO_FEATURES
ERROR: Unable to parse
/home/akini/openembedded-core/meta/recipes-core/packagegroups/
packagegroup-core-boot.bb: Exited with "1"

Hence i used DISTRO_FEATURES += "opengl x11"

Anything i am missing with DISTRO_FEATURES ?
I am making this entry in the conf/local.conf file.



On 1 October 2013 13:31, Burton, Ross <ross.burton@intel.com> wrote:

> On 1 October 2013 12:20, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> wrote:
> > I can confirm this error that occurs when you set DISTRO_FEATURES =
> "opengl
> > x11".
>
> If that's all DISTRO_FEATURES is set to then I'm eglibc is bound to
> not compile, because almost everything has been disabled.
>
> You probably want DISTRO_FEATURES_append = " opengl x11" so that you
> don't overwrite the default features.
>
> Ross
>



-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

