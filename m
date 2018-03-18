Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 315297878B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 22:27:06 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id s13so6160716pgn.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=0fnZLPDvuRDHQ3/vu2ceBYfqwL6Z/O2luAyg6UOqOX8=;
	b=R8WLnfyJDUzg27AJ/aGjUlSDSjJwLGTSThg0bg5Mxmnjs21gi23Z98psuSZphI6pjE
	xG2ZI3YOoNHXD+j1VxPnHudMDYe+ZWlmoxxHr54V87sh7KDnc/WjTsdLjV4BZxQG6aMC
	bPmc/WHM94Xk9/lk66c7FS12RqWuTUXxLbvzDP/fX8Z5SbxB61tn0p2EtRj+JieXKo9N
	kPo1OZ0i7WsvkTk/Nsaa2jSiZAVOO3kCYyayAKWVsqnTMpGkaoKM7EsoEPiEQfhm4q3n
	zLoemmoSRy86iM0Kt+6w7IIRDcFlj5ouMuiyzwR8Kx0aaj3rk5XR6yilepdZgeEXLNlV
	r+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=0fnZLPDvuRDHQ3/vu2ceBYfqwL6Z/O2luAyg6UOqOX8=;
	b=r1CjV+iyzX3miE+jwo+PoJsQi0i5KVO+sYO0FZ87FWZ68BT9BOQaDi6ij1ACe4kNbe
	P7eBzSHptVl9eBvqX7HWN2CwBuiKAZzi1tOOXNCDULTf0WjZfTZamDL/M+o8IHM3Agyo
	DRcOrWtEJi5pz35j10fJkwfFeE16vdRML36+rvTJ6glGS3LFbqrOeOgclvE7YBVHAG0o
	OIbXicRjZn9iilaWCEbVvc9ydBMNuF8BaQ+EjmlDRiVmooCnJigjBK9xGh6JcEjsO1ZM
	iSk2Z7UJpQ5y+Le5pRutgqCYhMs9fihkDV4Ut6sRjJRhKsdzvjYwyeDuZvIa5p0GLXOl
	HXzQ==
X-Gm-Message-State: AElRT7EjbHP/Kz6oXOgrGRxxGXpzBsVHiKFgyF9h83gLfzncM3cMbqAg
	WbqeIYmB5hpfiPPK119ebyKdMA==
X-Google-Smtp-Source: AG47ELubShqjXPpUFEl1vVAen8wAwUHk7FMXsP2moPIN+r+R5tK6BmeDRf9lUGaM1NX2nnv1Im0hdw==
X-Received: by 10.101.96.47 with SMTP id p15mr694870pgu.430.1521412028289;
	Sun, 18 Mar 2018 15:27:08 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:4088:e426:a566:fc98?
	([2601:202:4000:1184:4088:e426:a566:fc98])
	by smtp.gmail.com with ESMTPSA id
	g80sm25875062pfj.101.2018.03.18.15.27.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:27:07 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <662de5ec-d65f-f08f-547f-8034ecdf32b4@gmail.com>
Date: Sun, 18 Mar 2018 15:27:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: Improving meta-openembedded
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
X-List-Received-Date: Sun, 18 Mar 2018 22:27:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

I have heard on this mailing list and in person at ELC concerns
regarding the quality of=C2=A0 meta-openembedded.=C2=A0 I believe we can =
address
these concerns by taking incrementally steppes to achieve the end goal.=C2=
=A0
Since these layers are maintained by volunteers, I will not put a date
for this goal.=C2=A0 This goal as I have expressed it at ELC are testimag=
e
capable builds that cover multilib, musl, lsb , more architectures and
the alike.=C2=A0 We can leverage similar build configurations that are us=
ed
for oe-core. This is where the "*" comes into play. As each
meta-openembedded sub-layer maintains ticks off at step, we will get us
one step closer to this goal.=C2=A0 We work=C2=A0 from the bottom up and =
at their
own pace. I think we should start a wiki so we can start on the list of
steps/configurations.=C2=A0

Well, that are my high level thoughts ( hope it makes some sense ??).=C2=A0=
 I
hope those who have been vocal about layer quality will see we are
trying and have a plan and they are more than welcome in participating.

kind regards,

armin





