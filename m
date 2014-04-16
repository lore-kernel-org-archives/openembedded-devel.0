Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 22A7165E56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 10:40:38 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so10604056wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 03:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=0TN3U9WcSloyRbSiBgHalh8lgBuGv8qx2O3Wam/Kwmk=;
	b=hC1sEmNnKSu5J5+SkfyhvuOSSetoH5D+E/czAMyUDxdjsKWPABBXxsmElID8mOAI+R
	JFBdFKeaNleGR6YEr5Auai/63NtoBSjRJk6ms/aHfRvDlRbWDFJTC+1QFRTv3HNntjVI
	MTg/yvz5MqOUqextC+NvCzms4aR8UxpECtwT5vAfCOi6JKLtRkWOrktCAU2jxH8APH3w
	1mYMHODthscQpw0dEliTcxxTxfLQRN6ouTt5wMZN72Y3tnyoCoKXsggJCuZpJKd+tzjz
	hj4V1S1QSCZyds8wKA7LsEm5W/rWmvUHV+YsM66qR0lAKL6mDQTWNwrihBHxc7L1Tv46
	FETw==
X-Gm-Message-State: ALoCoQmlzfjleL5FD+/zL/eTm7SAtyj66cpytguOf4RKlLfq/vJiKifn1tum4tbkQ+1jsX6L6Shi
X-Received: by 10.180.85.10 with SMTP id d10mr18883173wiz.0.1397644838894;
	Wed, 16 Apr 2014 03:40:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::19d:70d4:8617:dd46?
	([2001:610:612:0:19d:70d4:8617:dd46])
	by mx.google.com with ESMTPSA id
	by1sm33770876wjc.26.2014.04.16.03.40.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Apr 2014 03:40:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2550139.OruyIUflk8@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 16 Apr 2014 12:40:36 +0200
Message-Id: <FFAD474B-E640-4B12-9ABE-F6FBAF8ADFA4@dominion.thruhere.net>
References: <1397631065-13521-1-git-send-email-Chong.Lu@windriver.com>
	<lilan2$1cs$1@ger.gmane.org>
	<2550139.OruyIUflk8@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: Chris Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] rrdtool: enable libwrap, perl and python bindings
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
X-List-Received-Date: Wed, 16 Apr 2014 10:40:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2014, om 12:02 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 16 April 2014 09:15:47 Koen Kooi wrote:
>> Chong Lu schreef op 16-04-14 08:51:
>>> 1. default enable libwrap, perl and python bindings
>>=20
>> A number of big distros are moving away from tcpwrappers, Arch has =
removed
>> it years ago and fedora looked into it a while ago. Since tcpwrappers =
hasn't
>> seen a release (or development) in years I think we should default it =
to
>> off.
>=20
> Chris added a tcp-wrappers PACKAGECONFIG to a number of recipes about =
a year=20
> ago; I wonder if we ought to promote it to a DISTRO_FEATURES item and =
if=20
> appropriate just not enable that by default.

I think that makes the most sense in this situation.

regards,

Koen=

