Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (unknown [209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0186FA66
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 17:41:33 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id 29so7772441yhl.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 10:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=N9Gy3rfKa3uukTES82Re37QqKeWFm5yct9Ulq+Uqnl0=;
	b=PoUtpJnXZFuEo30b+N3nIJfwMkXNp114fiYrHL33lp+lYUsxsvTSETnkg1TQzH9U9U
	fFJgWL+34as/TSVbmI/o3LL3kZuwmv7TXnW2KT1Hkhgt5gzY1v2GbjtglfXgAr3cJgfX
	RdVswcW7MbjI1ocBatzDNb+/VI51DdKvdcK8WFoXMLz/drSd0LqFUwrHpp38R+rk3Ja4
	WIbc7Lcjr6jpA9qZQO7V+noPGyqS22opDSafr17WiKDJWoDzujH/F8WySyEa/Rba8+Mu
	OOcnUYgLvAZtDRpFysHIwesQ+8RokI/kTfJ3rfdsBZACiVLrPx0ScpfnDavmXAa/BO6U
	vuGg==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr48504646yhh.33.1401212494112;
	Tue, 27 May 2014 10:41:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Tue, 27 May 2014 10:41:34 -0700 (PDT)
In-Reply-To: <1401209016-6182-1-git-send-email-ashcharles@gmail.com>
References: <CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
	<1401209016-6182-1-git-send-email-ashcharles@gmail.com>
Date: Tue, 27 May 2014 14:41:34 -0300
X-Google-Sender-Auth: vCynoZ-R2rMfOItQ_Y0XZIxrNRs
Message-ID: <CAP9ODKo01g9ZD8m1yQ0g=eAWc0MQk5HC2YC6U7xedRX5LWHnpw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] eject: copy po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 17:41:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 1:43 PM, Ash Charles <ashcharles@gmail.com> wrote:
> The po subdirectory found on the VPATH for an out-of-tree build so we
> copy it over. See [1] for discussion.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/096052.html
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>

After looking at the eject code, I think this is the best alternative we have.

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

