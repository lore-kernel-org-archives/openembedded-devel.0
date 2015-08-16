Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEFC65C85
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 00:29:33 +0000 (UTC)
Received: from [192.168.0.201] ([37.24.103.185]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MA9Yv-1ZX7TR2GnR-00BNhJ for
	<openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 02:29:32 +0200
Message-ID: <55CFD8B5.4000501@gmx.de>
Date: Sun, 16 Aug 2015 02:26:29 +0200
From: =?UTF-8?B?RG9taW5pYyBTYWNyw6k=?= <dominic.sacre@gmx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V03:K0:qIy400LoCBT1T2IhpifFmb68SYrqhHTLT+Dx4ztc65xCX4ZpAQh
	U5k8+gqmDJ6Zee98ERXu2n9HuXAuUJT3sMooOVcz+HiHZpYxxY+xnqh1GveUwJRXfTl3h+i
	ai5AJVeBp76XcavNmn5FvHfU7EuGxe33h8GhzW+zid2R6iqGI2En0c9nXmoLcJbRBfAdZla
	RqJN+YYdUaAYDBzdJDLYw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:TjWWguHagHY=:axAqohTTASLPK3ajwBocCB
	oqiaGmeRzxQLMtVY8Sb0PwUU018nWaiLkh9eqII20wREfela+xMKobIqOincJobCR9HfSyusO
	8LLKU+7IcZ2Spvxx78Ppq7/8t4ALh45pd3SHu1LZNceQtdp9Xo/rMuxbsgxvA/5vGbxSgSw6Z
	AtltZFk8FgKHos8sgiakl4dFwqNvDMS2GO0GC19+ttMoyggXrjSSResC1qZN+VvlQ64/QYx0l
	rCCyOP6iCequbBcd7Lc6y+E+nH1oX8r3RcOxuojgOc7iumdZaHEiUtm2s1Y3rj+xDEr980Dp9
	eZ/4/tEvI35Cu7XPoo6zmo9zdPW5t6pd+O6+sRavMwAL5ey98bcFJXDYFrR5ndCbig8pl5nAm
	ZqN8HjTFdlR7Kk6BKqLLubnXUTRLVUoBv0K5f1wDWfHRpm5nvaKL4mvfvGi4/iEPXttUFwJ5U
	oRMwC45fwjKzPlX93xjwBEDlPA9TScPTtP0uv4nYhH5dRRXXmWLnN+ktC/qKu1L+cYw31bnqz
	Lz+ZqQkK2sC5qagstrNUkNsnTcD7N+MJ0DQjB8eS8TwZdzNlndCvL6WA9sdjKknClCELTUuvz
	LUPBPDQ+8BugvgVdp5/Ui+/izQD8twtJUCJR+1ADF7H3Jwwj8dfOy9cZAsIea523JKAHZTyrE
	YabN8nZmzL3k0mCKum0Y0SYLMa6L3eZUw/Bt1qQ8KGDZoqs8UHYybZVHfuPpqKmI1TYy7nbub
	bzqmipspWphaXB8K5ZdC45/RzbNSK7jEK0Wxxg==
Subject: Python 2 and Python 3 module recipes
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
X-List-Received-Date: Sun, 16 Aug 2015 00:29:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to build a Python 3 application which depends on some modules
that are already packaged in OE for Python 2, but not for Python 3.
Since OE currently has virtually no Python 3 module recipes, this makes
me wonder what the best approach to create these recipes would be.

In most cases, I could just copy a Python 2 recipe, change the name from
"python-foo" to "python3-foo", and replace "inherit distutils" with
"inherit distutils3". However that would create a lot of duplication,
and might turn into a maintenance nightmare.

Do you have a suggestion what the right course of action would be? Move
most of the recipes' content to .inc files that can then be included by
both Python 2 and Python 3 recipes? Or maybe create a .bbclass that
would build both versions from the same recipe?
Is there any functionality already in place that would simplify this task?


Dominic

