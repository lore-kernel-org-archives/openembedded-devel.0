Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0835F65E03
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:51:50 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id uy17so6163859igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 01:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=2P2pmrb6TQhFmeOho7/4TrjTeX+IUtHv5HLMCfaNEEE=;
	b=OwQ3ve3obbWWIaZbh+h1xEYYHxfmdPQz6wlnPTYCzcri3K+l8zPZANBzJ/z1HIrmdT
	cesxSd2tVkD0WFXAI6L+XsvkFiSGXpZDwZq9YSi2NDFNv39WuMAIVJAh1I1C52gFIO96
	677Aql6BSFB+u0BtjBtIDFE66o+mqKQXX+Zx2dPdvdBPLMeZzEbPBhi4/io/l7TlyeJw
	Y+cqYGShxwtIh6VTcYNyvq8r2Hgo/2BBktyD+bg91VLLY/XvBfZwGngJrgc6A38TWTNn
	ydCOj06gfUoz7a7ecgnApjjf7iXFVFhbIjB/Bf7qd85j9JrEXsNAt9dML39sUOfv8bX7
	4PWw==
X-Gm-Message-State: ALoCoQkeqjpT/ZTEI+q1ZrJv6PyGy4FCReSicaB/jPhdxy4uKm3s/RPdXLMOj5bWYpu1NlvPcMyn
X-Received: by 10.42.88.204 with SMTP id d12mr7248280icm.24.1397033511246;
	Wed, 09 Apr 2014 01:51:51 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id z5sm3620499igl.13.2014.04.09.01.51.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Apr 2014 01:51:50 -0700 (PDT)
Message-ID: <53450A23.3060107@linaro.org>
Date: Wed, 09 Apr 2014 04:51:47 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	koen.kooi@linaro.org, Martin Jansa <martin.jansa@gmail.com>
Subject: checksums for multiple sources
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
X-List-Received-Date: Wed, 09 Apr 2014 08:51:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is there any way to specify for which source tarball a particular
checksum is referring?

meta-openembedded/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
has 2 source tarballs (and a patch):

    SRC_URI =
    "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz \
              
    https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
               file://0001-Fixup-aapits-build.patch \
        "

but only one set of checksums:

    SRC_URI[md5sum] = "c72b61e092d2b25726dfff6e455116c9"
    SRC_URI[sha256sum] =
    "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba782f8ecf03971a3a2c"


My build fails because it tries to verify the one checksum against both
source tarballs, which fails:

    File: '/home/trevor/devel/Downloads/acpica-unix2-20140114.tar.gz'
    has md5 checksum fcd4b7304f1bfabc7d4b9cfdecc6b0c6 when
    c72b61e092d2b25726dfff6e455116c9 was expected

NOTE: this checksum is correct for the first tarball
(acpitests-unix-${PV}.tar.gz), but not the second
(acpica-unix2-${PV}.tar.gz).

