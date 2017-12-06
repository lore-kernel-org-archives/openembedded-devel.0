Return-Path: <bill.randle@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id B3B08786A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 03:17:07 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id d27so2198098ote.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2017 19:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=De1HeyaXnchON9neUlS+GHfwbfqbBHxEIx9/Mif/5vs=;
	b=hIrCeLIz8lOUon5XAscCKMi1euQ8OI5XCFb1sEq8udyaShV/mXjBLooHpgdGShJFtX
	t88PUrGAt8/xHDJHJmZ5OOUIe3vldTsGxDA2+mgv+QtGeu/oQFIA+QZ+43Ai/QquiQNw
	AKH6FPLuG7DzDxaEIt8G09H3og5aQIjv83K/jd0Q7Ajz7sj2E3/C1Dbyzt2VmRAFkNTS
	npIEgh4Xm2T3epbb1z8b5Nd74iCPX4i79b+8sKHEqsnPLDGRSjIZwd59m/Zxjq55WExV
	yIHQscVsTHYvncxpeyFueHVhYL13hJkd1aHqK5D3KIeWN3ae2YV3ncBz5kEHdF1MgzO7
	YTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=De1HeyaXnchON9neUlS+GHfwbfqbBHxEIx9/Mif/5vs=;
	b=Px4tjNAC9wfpAKuH0oQQPicdVbWdwC4atpAunUEHGY8yHSr3geMEgu5Pomxc4gmagG
	QwE5xf1eS35/2RdOBvp87wGtDBxDOamTrhc1jFknDxCIzDV/Gg1eFcUuA2x2lbXiSh5V
	skOevVSIahkavpwuVVMujYp7/dx/USGFn8WJBmuLBgq7hOYhn4x9Abm20b7CqpD+cFZK
	e3LZlG110w8PM3bkeIBl6qfbHmBBtY7mpk1iALE/O3wUZyIyJSDmn9E3qnoRjT8vDlA4
	1TUj5bKGU/bS4zT+VUIYjV6JleQvV5+vD0Gb2nXMyoZG1jBWG/8c/W0Yp3TwqbpjFWkr
	bKgw==
X-Gm-Message-State: AKGB3mKFS0fiIEfCsr4ctwltwcMkRs1u3ptc57OnrBN77ATtnE7c3Opa
	NBzPjRUsx4WS1q+Krv5RT7mOOfoNsB5kjLNXX30=
X-Google-Smtp-Source: AGs4zMYA/nPA664s6VeK5qB8Bzax8e634c2OPYfN5ug+b/xTvU37MHWONEGT8/TwObdFzRV0bdWOgdL7AyXBVMO4BfI=
X-Received: by 10.157.62.180 with SMTP id b49mr10715421otc.325.1512530228067; 
	Tue, 05 Dec 2017 19:17:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Tue, 5 Dec 2017 19:17:07 -0800 (PST)
In-Reply-To: <a8e4345d-9f1c-2e94-ba70-d66981bbce6d@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
	<a8e4345d-9f1c-2e94-ba70-d66981bbce6d@gmail.com>
From: Bill Randle <bill.randle@gmail.com>
Date: Tue, 5 Dec 2017 19:17:07 -0800
Message-ID: <CA+n--H9DjDrHHGejs92_QmGW1SC97yDS9ieCZb--00N9nssMrQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Tim Smart <ticotim@gmail.com>, openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 06 Dec 2017 03:17:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 5, 2017 at 6:48 PM, akuster808 <akuster808@gmail.com> wrote:
> Bill,
>
>
> On 11/29/2017 09:46 PM, Bill Randle wrote:
>> This set of patches creates the Python3 variant of several existing Python2 packages.
>> It first moves the core of the existing recipe(s) into a .inc file, then creates
>> python-*-.bb and python3-*.bb files that reference the new .inc file.
>>
>> Bill Randle (12):
>>   python-dominate: move core of recipe to a .inc file
>>   python3-dominate: new recipe
>>   python-flask-bootstrap: move core of recipe to a .inc file
>>   python3-flask-bootstrap: new recipe
>>   python-flask-sqlalchemy: move core of recipe to a .inc file
>>   python3-flask-sqlalchemy: new recipe
>>   python-flask-wtf: move core of recipe to a .inc file
>>   python3-flask-wtf: new recipe
>>   python-visitor: move core of recipe to a .inc file
>>   python3-visitor: new recipe
>>   python-wtforms: move core of recipe to a .inc file
>>   python3-wtforms: new recipe
>
> I am seeing these additional issues:
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'python3-wtforms' (but
> /home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-wtforms' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-wtforms']
> NOTE: Runtime target 'python3-flask-wtf' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-wtf',
> 'python3-wtforms']
> ERROR: Nothing RPROVIDES 'python3-flask-wtf-dev' (but
> /home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
> RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'python3-flask-wtf-dev'
> NOTE: Runtime target 'python3-flask-wtf-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-wtf-dev']
> ERROR: Nothing RPROVIDES 'python3-visitor' (but
> /home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-visitor' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-visitor']
> NOTE: Runtime target 'python3-flask-bootstrap-dev' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['python3-flask-bootstrap-dev', 'python3-visitor']
> NOTE: Runtime target 'python3-flask-bootstrap' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-bootstrap',
> 'python3-visitor']
>
>
> please check. still running local world build so not sure what else will
> pop up.
>
> - armin
>>
>>  .../recipes-devtools/python/python-dominate.inc        | 11 +++++++++++
>>  .../recipes-devtools/python/python-dominate_2.3.1.bb   | 13 +------------
>>  .../recipes-devtools/python/python-flask-bootstrap.inc | 14 ++++++++++++++
>>  .../python/python-flask-bootstrap_3.3.7.1.bb           | 16 +---------------
>>  .../python/python-flask-sqlalchemy.inc                 | 10 ++++++++++
>>  .../python/python-flask-sqlalchemy_2.3.2.bb            | 12 +-----------
>>  .../recipes-devtools/python/python-flask-wtf.inc       | 15 +++++++++++++++
>>  .../recipes-devtools/python/python-flask-wtf_0.12.bb   | 17 +----------------
>>  meta-python/recipes-devtools/python/python-visitor.inc |  6 ++++++
>>  .../recipes-devtools/python/python-visitor_0.1.3.bb    |  8 +-------
>>  meta-python/recipes-devtools/python/python-wtforms.inc | 16 ++++++++++++++++
>>  .../recipes-devtools/python/python-wtforms_2.1.bb      | 18 +-----------------
>>  .../recipes-devtools/python/python3-dominate_2.3.1.bb  |  2 ++
>>  .../python/python3-flask-bootstrap_3.3.7.1.bb          |  2 ++
>>  .../python/python3-flask-sqlalchemy_2.3.2.bb           |  2 ++
>>  .../recipes-devtools/python/python3-flask-wtf_0.12.bb  |  2 ++
>>  .../recipes-devtools/python/python3-visitor_0.1.3.bb   |  2 ++
>>  .../recipes-devtools/python/python3-wtforms_2.1.bb     |  2 ++
>>  18 files changed, 90 insertions(+), 78 deletions(-)
>>  create mode 100644 meta-python/recipes-devtools/python/python-dominate.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-visitor.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-wtforms.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-wtforms_2.1.bb
>>
>

Thanks, Armin. I'll go back through them all and make sure everything
builds cleanly. It was working at one time, but I obviously messed
something up when rebasing against master and submitting.

    -Bill

