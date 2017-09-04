Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 35A4971C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 23:36:37 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id g13so3641397pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2017 16:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Z3gYiSnRo2rgwmKjWQzzW2zncCwPOKt8DCNSSd7M+yw=;
	b=n/rwqaYsC3XxkG2ncVZbwbGKPb6b/4MZQf1ymqZCDbYl4uuXFKtjtsJ48iAGs5dvBn
	EtLPZiC6EIbEa4bq34dVl7y+Dnw5SFpIHpIkWEKopT4RegoKjeqSKkbCXeX4PWVsPnJs
	k1DL7uRzKeK9kubbDLWUYfHTbR1k55Bja73XPbIhgL9vqA2ZBijDm+FtVI7Odr8k5qFl
	BiQOt/Vz+sntTRCEu/vHvH/gUeg1jaFi3RtkxU0o2hs6BPtTYhAZWNLcldEnQPBKUUIo
	ETp7c2d0YSDVKovWKUjZ+Qe4dBsXL3iIxBUKQQLRpKmRIo7nt3W3HuVMl6mG5J4ZYwZC
	yt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Z3gYiSnRo2rgwmKjWQzzW2zncCwPOKt8DCNSSd7M+yw=;
	b=VFe+zr6EHuueLMGJkwrwCrOOTqpGJq4Lc69I4XKk2zY4j8qw0VjUiCuE1wadVXuNhh
	exNdKIemLsi8/ktM9dE+u2bpDTE9i6P/lx/yruEvkISy123noqWmP997fsDP8X5dCbDb
	bs7i9NCCrl7DbaYL5ZRab+i2Tehb8zUtUbb7AFtnRet9Vv58HbXMbf76/dOlFx1HY2Dw
	Vhj74ciPOcFO9cI4RkPcRXDok97HTaK/F+7mezEuNhA/QbvLeTwC0gVfzjDKjZgX10h6
	acCMQuqwRGAr8Y/a5L5cPYEYB+NK3EoN0N4QzDBWkIly1/kCLeaapRfbpKT9qBzCjC5G
	u6yg==
X-Gm-Message-State: AHPjjUi8pIiaNsawnIHStxQT8q2F7DrFkiFwGAh36vVlaOrkE6KUi3YK
	D7s3Aot7bUEdHQ4I
X-Google-Smtp-Source: ADKCNb6QndlagYtsl41/ikByyUMcwmCBM77/4e9tJpu/sTDMs1H8UTSV0sZX2r9SWrgsHm6zZpwlTQ==
X-Received: by 10.84.210.45 with SMTP id z42mr2295281plh.132.1504568198587;
	Mon, 04 Sep 2017 16:36:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b0f0:5dac:8a48:d7fa?
	([2601:202:4001:9ea0:b0f0:5dac:8a48:d7fa])
	by smtp.gmail.com with ESMTPSA id
	21sm11731116pfb.146.2017.09.04.16.36.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 16:36:38 -0700 (PDT)
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	openembedded-devel@lists.openembedded.org
References: <1504276118-29353-1-git-send-email-mikko.rapeli@bmw.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6a31d1c8-0b36-df07-42d6-2b5b2a28585b@gmail.com>
Date: Mon, 4 Sep 2017 16:36:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504276118-29353-1-git-send-email-mikko.rapeli@bmw.de>
Subject: Re: [PATCH] cve-check.bbclass: detect patched CVE's also from patch file names
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
X-List-Received-Date: Mon, 04 Sep 2017 23:36:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Mikko,

wrong ML. I think you want openembedded-core@lists.openembedded.org


-armin


On 09/01/2017 07:28 AM, Mikko Rapeli wrote:
> While poky master branch has been fixed so that all CVE patch files have
> the:
>
> CVE: CVE-2017-1234556
>
> strings in the patch comments, many older versions of poky and other meta
> layers are not, but the CVE patches quite often have the CVE id in the
> patch file name.
>
> If the CVE: string also found, there are no duplicates in the report.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>   meta/classes/cve-check.bbclass | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index f44bbed..bc2f03f 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -118,10 +118,24 @@ def get_patches_cves(d):
>   
>       pn = d.getVar("PN")
>       cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
> +
> +    # Matches last CVE-1234-211432 in the file name, also if written
> +    # with small letters. Not supporting multiple CVE id's in a single
> +    # file name.
> +    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
> +
>       patched_cves = set()
>       bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
>       for url in src_patches(d):
>           patch_file = bb.fetch.decodeurl(url)[2]
> +
> +        # Check patch file name for CVE ID
> +        fname_match = cve_file_name_match.search(patch_file)
> +        if fname_match:
> +            cve = fname_match.group(1).upper()
> +            patched_cves.add(cve)
> +            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
> +
>           with open(patch_file, "r", encoding="utf-8") as f:
>               try:
>                   patch_text = f.read()
> @@ -140,7 +154,7 @@ def get_patches_cves(d):
>               for cve in cves.split():
>                   bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
>                   patched_cves.add(cve)
> -        else:
> +        elif not fname_match:
>               bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
>   
>       return patched_cves


