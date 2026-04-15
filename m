Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71D7FA0C34
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 06:14:15 +0000 (UTC)
Subject: Re: [meta-oe] [master] [PATCH] augeas: Add CVE_PRODUCT to support product name
To: openembedded-devel@lists.openembedded.org
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 23:14:06 -0700
References: <20260413112313.1825573-1-hjadon@cisco.com> <134abd7c-df60-42a4-b836-c7984e62d1e4@gmail.com>
In-Reply-To: <134abd7c-df60-42a4-b836-c7984e62d1e4@gmail.com>
Message-ID: <1426462.1776233646766468418@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1TV17eoN6SmmkkO8ZVkB"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 06:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126341

--1TV17eoN6SmmkkO8ZVkB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for checking and raising this point.

You are right that currently NVD shows only one clear CPE mapping for
augeas, and at present we have not observed any misreported CVEs or any
ambiguous CPE matches for this recipe.

This patch was added as a proactive metadata update. The intention is to
make the recipe-to-CPE mapping explicit, instead of depending on implicit
name matching. This helps us keep mapping behavior stable if matching
logic changes later, or if NVD adds another vendor:product combination in
future with a similar token.

As of now, this change does not alter current CVE report results. It
is only for clarity and future safety, and it does not impact build or
runtime behaviour.

--1TV17eoN6SmmkkO8ZVkB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Thanks for checking and raising this point.</div>
<div>&nbsp;</div>
<div>You are right that currently NVD shows only one clear CPE mapping for<=
br />augeas, and at present we have not observed any misreported CVEs or an=
y<br />ambiguous CPE matches for this recipe.</div>
<div>&nbsp;</div>
<div>This patch was added as a proactive metadata update. The intention is =
to<br />make the recipe-to-CPE mapping explicit, instead of depending on im=
plicit<br />name matching. This helps us keep mapping behavior stable if ma=
tching<br />logic changes later, or if NVD adds another vendor:product comb=
ination in<br />future with a similar token.</div>
<div>&nbsp;</div>
<div>As of now, this change does not alter current CVE report results. It<b=
r />is only for clarity and future safety, and it does not impact build or<=
br />runtime behaviour.</div>
</div>

--1TV17eoN6SmmkkO8ZVkB--

