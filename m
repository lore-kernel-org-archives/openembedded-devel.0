Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 07E1F71AB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 02:48:02 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id w7so1595353pgv.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2017 18:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=lF8qFhHYZvTqCIOYnqyFuezRkDjrFowjxTTHA94rz5Q=;
	b=N69hh8IVWdoEzAoaKQw27tdXYiRSkaeQftNg2JmawClA7PjaaFXSXioOpDXAvJecRx
	T5aEM9pOWwu2d2h7ohapwnjiZlCoU3pHk7wlLOgIdV43WDzKPHPHtsKoKbbC/0yvRMid
	7k3oOKaIwucXM6171hK63SahEHvCUEjww1JOesYgiT1f0OvClPobFAaUJqm6vTj8PTgr
	M0eUhdbiIilKJlwJZTsK81/kqDb5kJ9avRs1vv1E4vheQbq7mlZFuX9cplsaVcBWXyco
	XCKiBcGTycZsiTU1A5obyv1bEjoo5dj6AgB12j0QIUe99Nd5D2GXYonEyYFBsfeGj/BU
	Pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lF8qFhHYZvTqCIOYnqyFuezRkDjrFowjxTTHA94rz5Q=;
	b=ryDN6yF03rAflp3CvUZhyCbXJx/CCW5ZCPHzrqv9z1Nf0L5z96t2J0hzQmh9pl2851
	sFD6NrR3i8RXp8w7KU6/3z6nYE3lVM2oN/QMJvt1kEgUV7F2JDINYN3vig19+fuxZZDX
	tFAYCglPFLte3Hm2gNK7LyB3antH850lrR3CgYJaYhuq9Th+SpwDer2wNZ1me5coAcoK
	+TLRkKIo85oN6XhllMU/S7+h6ZJ1dKzmSJCSI5IStERuL5pNIMIraxAytSeGPx8Hf9fQ
	pYoG+hFkkpqMCTUUfKdsegWVwxkvrELRhpdSVcTA1iE8ujJoI72iyPpUUr+3jU+JoH36
	mZig==
X-Gm-Message-State: AJaThX7ZqpcERJpnN9c0NmfLUQGZWXxeeQWbUeF8mCBXiDCAj6EAtbBu
	msIjh8CPPOK79VQqIpOE2J4=
X-Google-Smtp-Source: AGs4zMbRRINeQAm6bWHc3uKMKD6/F0lmz4B2cQLzolZPuAcvNL1SHXI5vZH44VaB3kXT8eXHack3EA==
X-Received: by 10.99.6.23 with SMTP id 23mr19358711pgg.276.1512528483798;
	Tue, 05 Dec 2017 18:48:03 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:94bc:1c6f:280d:e35e?
	([2601:202:4001:9ea0:94bc:1c6f:280d:e35e])
	by smtp.gmail.com with ESMTPSA id
	68sm1945944pfx.186.2017.12.05.18.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 18:48:03 -0800 (PST)
To: Bill Randle <bill.randle@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a8e4345d-9f1c-2e94-ba70-d66981bbce6d@gmail.com>
Date: Tue, 5 Dec 2017 18:48:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: Re: [meta-python][PATCH 00/12] Create Python3 recipies for several existing Python2 recipes
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
X-List-Received-Date: Wed, 06 Dec 2017 02:48:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Bill,


On 11/29/2017 09:46 PM, Bill Randle wrote:
> This set of patches creates the Python3 variant of several existing Python2 packages.
> It first moves the core of the existing recipe(s) into a .inc file, then creates
> python-*-.bb and python3-*.bb files that reference the new .inc file.
>
> Bill Randle (12):
>   python-dominate: move core of recipe to a .inc file
>   python3-dominate: new recipe
>   python-flask-bootstrap: move core of recipe to a .inc file
>   python3-flask-bootstrap: new recipe
>   python-flask-sqlalchemy: move core of recipe to a .inc file
>   python3-flask-sqlalchemy: new recipe
>   python-flask-wtf: move core of recipe to a .inc file
>   python3-flask-wtf: new recipe
>   python-visitor: move core of recipe to a .inc file
>   python3-visitor: new recipe
>   python-wtforms: move core of recipe to a .inc file
>   python3-wtforms: new recipe

I am seeing these additional issues:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python3-wtforms' (but
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-wtforms' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-wtforms']
NOTE: Runtime target 'python3-flask-wtf' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-wtf',
'python3-wtforms']
ERROR: Nothing RPROVIDES 'python3-flask-wtf-dev' (but
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-flask-wtf-dev'
NOTE: Runtime target 'python3-flask-wtf-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-wtf-dev']
ERROR: Nothing RPROVIDES 'python3-visitor' (but
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-visitor' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-visitor']
NOTE: Runtime target 'python3-flask-bootstrap-dev' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['python3-flask-bootstrap-dev', 'python3-visitor']
NOTE: Runtime target 'python3-flask-bootstrap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-bootstrap',
'python3-visitor']


please check. still running local world build so not sure what else will
pop up.

- armin
>
>  .../recipes-devtools/python/python-dominate.inc        | 11 +++++++++++
>  .../recipes-devtools/python/python-dominate_2.3.1.bb   | 13 +------------
>  .../recipes-devtools/python/python-flask-bootstrap.inc | 14 ++++++++++++++
>  .../python/python-flask-bootstrap_3.3.7.1.bb           | 16 +---------------
>  .../python/python-flask-sqlalchemy.inc                 | 10 ++++++++++
>  .../python/python-flask-sqlalchemy_2.3.2.bb            | 12 +-----------
>  .../recipes-devtools/python/python-flask-wtf.inc       | 15 +++++++++++++++
>  .../recipes-devtools/python/python-flask-wtf_0.12.bb   | 17 +----------------
>  meta-python/recipes-devtools/python/python-visitor.inc |  6 ++++++
>  .../recipes-devtools/python/python-visitor_0.1.3.bb    |  8 +-------
>  meta-python/recipes-devtools/python/python-wtforms.inc | 16 ++++++++++++++++
>  .../recipes-devtools/python/python-wtforms_2.1.bb      | 18 +-----------------
>  .../recipes-devtools/python/python3-dominate_2.3.1.bb  |  2 ++
>  .../python/python3-flask-bootstrap_3.3.7.1.bb          |  2 ++
>  .../python/python3-flask-sqlalchemy_2.3.2.bb           |  2 ++
>  .../recipes-devtools/python/python3-flask-wtf_0.12.bb  |  2 ++
>  .../recipes-devtools/python/python3-visitor_0.1.3.bb   |  2 ++
>  .../recipes-devtools/python/python3-wtforms_2.1.bb     |  2 ++
>  18 files changed, 90 insertions(+), 78 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-dominate.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-visitor.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-wtforms.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-wtforms_2.1.bb
>


