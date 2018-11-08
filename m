Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 31E466C0DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 23:13:36 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id e11so630052itl.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2018 15:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eXMyLMS2h9DrwnPwT1mBmtrtcDxHtoY1upDBcpjRXvE=;
	b=So92tpn/LzwsLzlpPIjP0KkchDV1NVvrYkPZ0rV2VM9ICslml0oB0m7QzM/rlWDCO3
	SAqm4JngbJdqppbkGVmuwCHftgZ5h+uQi6izHXgbhYZmNetAGGwY3rN/54CRp4X2jzED
	9EDCfnBG5qH0SJilkRKL2CDKEhdxB56+pq5BjbVpmvMPcGWXeuoFXqqJpAIBLYNy66k7
	25uwXsB2YBMJapijXsgk3rEK+TEzZnoQ0bPO5crnwi/UbgpesnagG+kq7hD2hoIeegjs
	RHjNTnpz4QBg+LfSBNnAAKNxGmUngawF8DKfUCx8DISCGJjwCjxHaZNvWwPghnTZldXH
	mlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eXMyLMS2h9DrwnPwT1mBmtrtcDxHtoY1upDBcpjRXvE=;
	b=drezSTTXvWRml3C2gzSafcwyX9r87TZ0Aqak5p3rV4sH7Y21A7cI5cyYz+Gzw6UG/Z
	Le83IoaTj1puwf0HyIvPC+cYtdNzruyfD09gBiN6I9MsM26ezM9FQuv8YRBTqyqFqFyD
	HlXiKyDSA0r8iOQwSRMCsfge2dd9ZpGOBaIyjsdeD9jYqgU4wU8GqpKSFReU5oH5K2+P
	4rqRAllEI6RcBZPxqj/fjkiIyHWlxoBZCapp4K6g9RJHr0YyUW7DNgQeyTTX6QKkKi4A
	1OycWzrJpgcS0joWeIaGVJdU4L4JuXsXbP7GQ4vFPJZvhS7n/+nBU1UQWwBcecRmHcWi
	Zlmw==
X-Gm-Message-State: AGRZ1gKqqKZM/Sgt8FENbojBnTiEs6osXCVohXbWQ6asNgx7CaM+mlWD
	+MIEPnuHebeaQyjOKZD/nck3hmjZPWpneA+4qEzx9g==
X-Google-Smtp-Source: AJdET5dAhdT9kaD6fnOpoGL/6Xsg9M6ogxmPtR2XPmEiuejKNjJC/WuoFYA9qKZWUgjrxwA7i5uU33Ui+zh/P6qwuoo=
X-Received: by 2002:a02:b572:: with SMTP id
	z47-v6mr6210381jaj.79.1541718817308; 
	Thu, 08 Nov 2018 15:13:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
	<CAJTo0LZJv8Pmoqnb5-Xb2Tjms12P_Oa4S69CxdYvHd=fRSWBNA@mail.gmail.com>
	<CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
In-Reply-To: <CAKPa3c2N1=Q-Ay5J=iN3U0U7HcR=8LEbTRVM7AMuFSqaLi=TzQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Nov 2018 23:13:26 +0000
Message-ID: <CAJTo0La=R27JS5BA9g9ZUZ=66pLqdHFsvAfcnG2qwBpwYQZgHw@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
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
X-List-Received-Date: Thu, 08 Nov 2018 23:13:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 17:28, Brendan Kerrigan <brendank310@gmail.com> wrote:
> Yeah it does have a build time dependency on gtk+2.

There's a --disable-gtk2, I'd recommend either just passing that or
for bonus points having a disabled packageconfig to enable/disable
gtk2.  GTK+2 is well dead now, so we shouldn't be building it out of
the box.

Ross

