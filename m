Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5E372491
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 17:27:21 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so1862449wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=GOmm785goj9dHvrEX4XC9QqsCEFe95utzoq057fgUQc=;
	b=u+Vj/qbqdz80YrEL/g5gXCAx1Ec/8Ubwkqo3zdnCsEgy4EwriaqGa50tPZmdHTWq+y
	wS0vw38Weovyxnvbe2NXXDQ2aVaIFCHjwss2My4ZYiq5hox6aVV2AXTFH50mggCwW/L9
	EIh1EhcQJJw39/i3qGX8bUagnnCqPlKm5p6XRS5BhKyHHJoavRMYhjPYcKJ7VPxxg43N
	jMJaIy/oXiNQ5QOR7pn+yN+vaLoWu/FHyPdzCUK3V38vjhHkCwkvOC8T5wNj4Y4NP68P
	Xn9vTnOkpGB/iaq5lChFWudkkfl/8C/ALwOAWIASqylZ+l8W6G3lLJfl7jHFguSYrXbP
	El0w==
X-Received: by 10.181.13.44 with SMTP id ev12mr31263508wid.17.1430242042793;
	Tue, 28 Apr 2015 10:27:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	cs4sm35183715wjb.31.2015.04.28.10.27.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 10:27:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Apr 2015 19:27:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150428172726.GB2322@jama>
References: <1430225107-10530-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sr1riQH+iB63MYYD2wNM6E2rDKnAZKQtaZamifrO64cWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr1riQH+iB63MYYD2wNM6E2rDKnAZKQtaZamifrO64cWw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] nodejs: fix qemuarm build without thumb and drop unused patch
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
X-List-Received-Date: Tue, 28 Apr 2015 17:27:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 07:43:59AM -0700, Khem Raj wrote:
> On Tue, Apr 28, 2015 at 5:45 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > +-      defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> > ++      defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || define=
d(__ARM_ARCH_5TEJ__)
>=20
> this fix is ok. but I wonder why qemuarm is defaulting to v5e and not
> v5te did you look at that

Because thumb is by default disabled and my world builds had small typo
in variable enabling it:
https://github.com/shr-project/jenkins-jobs/commit/45595b887e57252fc2e8b957=
44457a566fa554e9

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

