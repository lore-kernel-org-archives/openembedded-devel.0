Return-Path: <cliff.brake@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1640265CF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 19:16:27 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so8181922qaq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cJ0cPpi2R8NoXIxP37XE2F8km9U0qx2NYfi1A6GG7s4=;
	b=RDRah391LFhAseGFRGKuvzUXgXvqTXuIKSn/mpHD+vmHlkOPzMyqpV6lNhvHoar5N0
	BJAEQ7xRpNPm4h19GxM7PXAK18sZBLHkqp3OrOZMnu39ZFhuPJnW2uyXMZQ+GYkw6GQA
	ZAjqTQT9DIidmxrL0cgaWroPS5PCQtD/MHPMuJXYBz6wpQOOsggXsH9flNTSS0aQAlf2
	L9ZSVd+9JbkrT07vDVY9KEM4qkJAbyqO8eilpAQqZ7eZsHE8Ow2RrBP4LzG7i9pE9kia
	Pj8KFx6bbe4xgJcVrKXvphKmJfPWYv4jVE2E4lIuNCvLhFuYZ/gK09PEasOWsJzgRyMJ
	tBpQ==
MIME-Version: 1.0
X-Received: by 10.140.102.37 with SMTP id v34mr26287768qge.115.1404242188248; 
	Tue, 01 Jul 2014 12:16:28 -0700 (PDT)
Received: by 10.140.17.44 with HTTP; Tue, 1 Jul 2014 12:16:28 -0700 (PDT)
In-Reply-To: <CAOd_LFx-3ko_BrD_9VpPj-oairm8XQrfoWzq8JEWmcsFQuK_GQ@mail.gmail.com>
References: <CAOd_LFx-3ko_BrD_9VpPj-oairm8XQrfoWzq8JEWmcsFQuK_GQ@mail.gmail.com>
Date: Tue, 1 Jul 2014 15:16:28 -0400
Message-ID: <CAOd_LFxT6M-cCu4PJ9AwTZG6mTQihEJyS7mwRNonzBHZcyyq9Q@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking][daisy] pull request rng-tools, ptpd
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
X-List-Received-Date: Tue, 01 Jul 2014 19:16:33 -0000
Content-Type: text/plain; charset=UTF-8

(added branch name)

The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:

  live555: fix fetch problem (2014-06-23 12:58:31 +0200)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git daisy-to-merge-2014-07-01

for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:

  rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)

----------------------------------------------------------------
Balasubramanian, Aparna (1):
      rng-tools: Update rng-tools version to 4

Franklin Cooper Jr (1):
      ptpd: update to 2.3.0

 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
| 37 -------------------------------------
 meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
| 21 +++++++++++----------
 meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
 3 files changed, 13 insertions(+), 49 deletions(-)
 delete mode 100644
meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
 rename meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb =>
ptpd_2.3.0.bb} (56%)
 rename meta-oe/recipes-support/rng-tools/{rng-tools_2.bb =>
rng-tools_4.bb} (84%)

On Tue, Jul 1, 2014 at 3:13 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:
>
>   live555: fix fetch problem (2014-06-23 12:58:31 +0200)
>
> are available in the git repository at:
>
>   https://github.com/cbrake/meta-openembedded.git
>
> for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>
>   rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>
> ----------------------------------------------------------------
> Balasubramanian, Aparna (1):
>       rng-tools: Update rng-tools version to 4
>
> Franklin Cooper Jr (1):
>       ptpd: update to 2.3.0
>
>  meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> | 37 -------------------------------------
>  meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
> | 21 +++++++++++----------
>  meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
>  3 files changed, 13 insertions(+), 49 deletions(-)



-- 
=================
http://bec-systems.com

