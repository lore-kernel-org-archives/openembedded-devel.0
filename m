Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5BA6057A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 06:20:31 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id m62so589441vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8eZlcocBdUhIlvcxU9MlgTPdyMwmjN+rg2i34Ccsq2M=;
	b=nskJqdnbCarjjRRvbXF/knyVVv/iFro2dQEu0ZV91ckkgwvNOc6cKn8frgsWr0+NT5
	JdrytR+LgIzPAUKc0dwz3o8kjgk2tNqt++SbIrSC1OaP4EauQdDLJgQHc9CGHaN79Zwn
	tw58oC0d+jSfJ3kl9ugUkCxQtqljtzfOSAB2WnuzrUc1kUjW/OpDdz+RLbiu/G1FBmp4
	deSocHX3UObgnx5TCKLy/FNgjXPUBDgeGyHFHsxnETpSJu5DgLjA/I7oGiyG7g23OjN+
	j6ZxsJdXBY7rIi3HfO9AEAJzdldQd5CVAUOAPYFihDTXHrpv6PTagr9hx8AKiVQyYyhI
	71kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8eZlcocBdUhIlvcxU9MlgTPdyMwmjN+rg2i34Ccsq2M=;
	b=bpFvCPrLwMtWlrk/FnmZGzEoH1fIcFKRVhIixp4Soc0uXb6gWTiruiG8BJjj2Gn5Jb
	hKrZQZfLhYfhS5oRcpyy0Ajl5DCAg34laYZL1Mt68UBB9rb/BfvZ6HDFLFtv/cK4/pXb
	E/E5rEcNVX60sZXwnbIXGbSCu6hEwDclBiSMXtVgO9SnwlKwMKnwNOICygiDUAy9hnNX
	4bIyxcdyBJvVgJl+ZVH3dEkSglBjDCRJ/2ll078VtjsXUsoOmFIhJP32Ds4aGVENyT/e
	p41pCunCJ+MK9+GN15mc2HtefI8vt16SOSYWpeL7yrQ8Sydm65plwzxCUDTMknindFTJ
	fTug==
X-Gm-Message-State: AE9vXwMK7waCGRmJOAwkD+FlYL1Ao9Pdm79wkHuIKJD1F7k7Op9pJt+1hoa/yhWeiefaugfKmFMI4LPDIDSLoQ==
X-Received: by 10.31.171.202 with SMTP id u193mr1348212vke.67.1473920431707;
	Wed, 14 Sep 2016 23:20:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 14 Sep 2016 23:20:31 -0700 (PDT)
In-Reply-To: <1473387111-23110-1-git-send-email-akuster808@gmail.com>
References: <1473387111-23110-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 08:20:31 +0200
Message-ID: <CALbNGRSTTV=uzad6dNgh_Y2=sTQ48mUgN+S=gznvgLL80mq7mA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: akuster <akuster@mvista.com>
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2
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
X-List-Received-Date: Thu, 15 Sep 2016 06:20:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 9, 2016 at 4:11 AM, Armin Kuster <akuster808@gmail.com> wrote:
> remove unused config params.
> Drop PE
> Drop do_configure_prepend
> update PACKAGECONFIG's for graphics
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../{wireshark_2.0.5.bb => wireshark_2.2.0.bb}     | 24 ++++++----------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.0.5.bb => wireshark_2.2.0.bb} (69%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> similarity index 69%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> index 31ca4d2..dca3be6 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> @@ -8,21 +8,16 @@ DEPENDS = "pcre expat glib-2.0 sbc"
>
>  SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>
> -SRC_URI[md5sum] = "627b5fc6cf0aeca196c75debd5e69b14"
> -SRC_URI[sha256sum] = "0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
> -
> -PE = "1"
This causes

ERROR: wireshark-2.2.0-r0 do_packagedata: QA Issue: Package version
for package wireshark-dbg went backwards which would break package
feeds from (1:2.0.5-r0.0 to 0:2.2.0-r0.0) [version-going-backwards]
ERROR: wireshark-2.2.0-r0 do_packagedata: QA Issue: Package version
for package wireshark-staticdev went backwards which would break
package feeds from (1:2.0.5-r0.0 to 0:2.2.0-r0.0)
[version-going-backwards]
ERROR: wireshark-2.2.0-r0 do_packagedata: QA Issue: Package version
for package wireshark-dev went backwards which would break package
feeds from (1:2.0.5-r0.0 to 0:2.2.0-r0.0) [version-going-backwards]
ERROR: wireshark-2.2.0-r0 do_packagedata: QA Issue: Package version
for package wireshark-doc went backwards which would break package
feeds from (1:2.0.5-r0.0 to 0:2.2.0-r0.0) [version-going-backwards]
ERROR: wireshark-2.2.0-r0 do_packagedata: QA Issue: Package version
for package wireshark-locale went backwards which would break package
feeds from (1:2.0.5-r0.0 to 0:2.2.0-r0.0) [version-going-backwards]
ERROR: wireshark-2.2.0-r0 do_packagedata: QA Issue: Package version
for package wireshark went backwards which would break package feeds
from (1:2.0.5-r0.0 to 0:2.2.0-r0.0) [version-going-backwards]

Andreas

