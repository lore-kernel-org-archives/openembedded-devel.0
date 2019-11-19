Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9745E7F813
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:32:32 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r14so10433200lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hjz4ujLAp6wkPNt1teeM+HVE6pDf1QlX5KbuWpCgjeI=;
	b=LKAwD47LsTMag9QFI1doi8LAw/BNVeV+tHuc0yQGbqvfpCSOAHEBbGgaORSxN7mvaW
	CKEx019/Dsc3xS8CQlyhkjUC4ZX1pJ5crdw/LRVo1Cxhx2aD3WUnU0RAaI/cVo2rvXgP
	9Fuy8tqs7bgMz4uAA4a33cElrww6sbg95+hvdpEiCrHeZVAK/1XgmKXvzI3VwlrzKRsL
	531lCEBZWZQDQtev9CrkIK2BMqHu80FMwz2Av5m0f/wORGixN0TlCsGx7euMxqbABtRC
	KpobkdXerwmxaVv/xFFLUt06HtZiGfT9C5OTL8nqCjzGFrcWK0G1FCb8J7skF6YGRhn+
	SHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hjz4ujLAp6wkPNt1teeM+HVE6pDf1QlX5KbuWpCgjeI=;
	b=eap764HYtrm6ODhCIDhjA1YyHGqMYLb5ehvHerjhtljnZvOt+JLiArnBorIZEXogQY
	RSmhtcODTP4aoxW75hVwpw5HRo/N4qJWNi8sYdBOwBY28FwFZ0kuru7EgU+Vf6RUx+4H
	2TSc5DA0d59zdY1cCDoVm4thAi4yfBRpVtPWBAdGBHSHGiRWd5sPgrWLxWouGtOYSOVT
	iqp1PWwLAgtJAQjgfz5h/pMu/bxzp3JFHHO/romFLFYrQoIEPh/jvWjWNVAqzdAAv6Gj
	O8wstRd2KVJ9VquOfhS9b0uojeOscTem6JqWODbnYmQkUGgoRCAPI6SDE+98PoCLkBXM
	7M2Q==
X-Gm-Message-State: APjAAAU0u5tISbwg+/Xx8dhHSz/ypnZ2jMR3oTlpUqST0Ub+1uHPW4RV
	W8huk9VhUephsb+9qgTjao+Jn/EJAD50sxyRG54=
X-Google-Smtp-Source: APXvYqw71OOmQudjSFaMV10Llyj65YX7PM3/e9KO1rooUEIuisb6jwdWWhjkcyeMLSfSHWFrbbHx7uiZ0T/KQqMFT9E=
X-Received: by 2002:a19:fc08:: with SMTP id a8mr3899591lfi.168.1574170353036; 
	Tue, 19 Nov 2019 05:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20191119121609.19869-1-nick83ola@gmail.com>
	<1d110b29-23c2-12ea-68cb-32f465be8be9@intel.com>
In-Reply-To: <1d110b29-23c2-12ea-68cb-32f465be8be9@intel.com>
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 19 Nov 2019 13:32:21 +0000
Message-ID: <CABPh3UORbPCPd55aGFBO2WwfN0gGdaZHZk2Ei1jPu+PqUyV-UA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-importlib-metadata: fix class-target overriding default dependencies
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
X-List-Received-Date: Tue, 19 Nov 2019 13:32:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

if they are redundant then I can simply revert this patch??

commit fcda3fb1a3fbfac075325482074898dfb7138da7
Author: Fabio Berton <fabio.berton@ossystems.com.br>
Date:   Wed Nov 13 09:09:44 2019 -0300

    python3-importlib-metadata: RDEPEND python3-misc only for target and
nativesdk

    Python3 recipe rprovides python3-misc only for target and nativesdk,
    but if we have some recipe that rdepends python3-misc and has native
    in BBCLASSEXTEND bitbake raises an error showing that nothing rprovides
    python3-misc-native.

    Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

diff --git a/meta-python/recipes-devtools/python/
python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/
python3-importlib-metadata_0.23.bb
index 4c53d5fbb..851d703c9 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
@@ -1,4 +1,5 @@
 inherit pypi setuptools3
 require python-importlib-metadata.inc

-RDEPENDS_${PN} += "python3-misc"
+RDEPENDS_${PN}_class-target += "python3-misc"
+RDEPENDS_${PN}_class-nativesdk += "python3-misc"




On Tue, 19 Nov 2019 at 12:41, Ross Burton <ross.burton@intel.com> wrote:

> On 19/11/2019 12:16, Nicola Lunghi wrote:
> > -RDEPENDS_${PN}_class-target += "python3-misc"
> > -RDEPENDS_${PN}_class-nativesdk += "python3-misc"
> > +RDEPENDS_${PN}_append_class-target = " python3-misc"
> > +RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
>
> I believe all of the overrides are redundant now.  Try just
> RDEPENDS_${PN} += "python3-misc" and check the native build is still
> successful.
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

