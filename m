Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tmhho-0002ti-3s
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 10:18:48 +0100
Received: from mail-yh0-f70.google.com ([209.85.213.70])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Dec 2012 01:03:58 -0800
Received: by mail-yh0-f70.google.com with SMTP id o21so8912886yho.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 01:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=P2QnZ/lN+IXkSxOsQw9WL7tq/pIwa624D5xNk/RCZ48=;
	b=XpFoBuemX7PAFbpHQqCd+h2aAXuE0fBDlnyANBXZ5IyKm7t+zuFpJ+LWEsVdgAu2j0
	F6fxyfGC/iEuDdySDgEc2fcxMQV3fRHrB2lEUKt9owT8f7rrr4hgxvdQNFrpX2EQih3j
	qeAKxc/l6jaxIBmWsa6EJtWbudMPQk7IfIlb5PV0BEQBCCh6MG5igBFhOMZrM+TV7AUD
	mdsrAah1uuAJdR9q8KOHJWKUQvgtzt92Kzr6lv2nQmCcQDEH5dJhCqH75mM4NNkMZ6+T
	+UiKaS0jJ3KngN7beh94IDSU74/vQF7w1wAUYqPnlS+HZiOKn4e7w5LTq9c1QuN4uNqR
	R+2g==
X-Received: by 10.52.180.200 with SMTP id dq8mr24077349vdc.71.1356253437220;
	Sun, 23 Dec 2012 01:03:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.52.180.200 with SMTP id dq8mr24077340vdc.71.1356253437017;
	Sun, 23 Dec 2012 01:03:57 -0800 (PST)
Received: by 10.58.178.244 with HTTP; Sun, 23 Dec 2012 01:03:56 -0800 (PST)
In-Reply-To: <20121222200925.GD8988@jama.palm1.palmone.com>
References: <20121220132241.10D7310354@opal>
	<20121222200925.GD8988@jama.palm1.palmone.com>
Date: Sun, 23 Dec 2012 09:03:56 +0000
Message-ID: <CAJTo0LYQetj+657NjT+BHpg6jCOzUq63Ad2ghesThWvcLiSxcw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlXv9+Z5SP2R1NhDi6lBzNAJai7JyNx6nmUBP52B0WHI71sSmRuFnHXYv/MFcVSF4fwJofo3EViqim1asKV0nzIRYZdEKwPKnUATa5+DTRkmqkzB4hvQIi8tdDuVp3biXk4IQGasYpwhV+BI4TZsShhMpXsyudXSjtXwKZ5Qpq53PyG7dYUrIvvdIxqmnbfCxuA2rxQ
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : python-mako: install standalone, not as an egg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 09:18:48 -0000
Content-Type: text/plain; charset=UTF-8

On Saturday, 22 December 2012, Martin Jansa wrote:

> This is causing new QA issue, please fix that
>
> python-mako-0.7.2: python-mako: Files/directories were installed but not
> shipped
>
> /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/mako-render
>
> No idea why I haven't noticed it on first test..
>

Or how I'm sure I've never seen that. Maybe interaction with some ther
patch. Need to use setup tool.bbclass anyway, will investigate.

Ross

