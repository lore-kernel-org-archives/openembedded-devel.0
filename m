Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4F54A71A3E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 20:53:58 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id r141so3773327qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ke7cmuGF9+pAcnJDxa0HC/7F+XWBsYu+JsMfa9OnQos=;
	b=MYdVg6EMWI9XRhYin27wQrHAwFL4M6IeO+6kA/adYC9Q9zRE9Y+bTeNWKFcxiRB1nl
	rgBpJESBcKw/MmwyNXBe06C0Wm5BxvFUewYbFew/rI/J3GXjblAZvy3ZokxF0rccqGjc
	LlFXxaNv6wBbhrgsnGDN3pgp+QbdESZ30prbVzr71mhhc9l4+Ok3Z4Gzo07ON8Kd7pda
	CTUlkqmIkj+Qg2KdrWES0h0g6rO5Ujv+Jd6wpmKFkKl6Kc5KoIT6VgNbMmyPeZ65cyfu
	EX4McJ1fr6cTYULBjgu6xe5Rv9mFGY1QLjfQPHyxyj4chpqADYwO+/9CZVUhAMGoiKuX
	dMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ke7cmuGF9+pAcnJDxa0HC/7F+XWBsYu+JsMfa9OnQos=;
	b=O79ppSGbRy1PDcz1tmFHJsxnx2oCYBaYFSWPg44VFGi6J5ntLTbdRgxjGEjZ33LzR3
	rm9zdNMzrbLkm+H2ZpJNcY6igPCxhomkHJNgg+stWi2sO+ll5LCBuK8t1v3+gNF9C8SK
	Y0ME2a4ZFM7c5CW387xiSYgQnWeQ7F6bv7wI+JMjo4EWpoCW0I7CGjhXgIsOYk7TxNcs
	tYwtHU2WcvaKb2XIQjMFI5oXk/m2pgfJHcXn4zQKJKvMHdiI+Rmhm2wWGvGmvR1hggv4
	+oiB5cjx1tn26dl92Z+9A9qJndtPTMQ+m/zyU0X8t3hoQXE7ZGBmEKsPLGucL3cQQX6U
	JJxA==
X-Gm-Message-State: AHPjjUihb+Pl6gmOBJscihhZGt6iWKSrdcF/UsSO3WoYhj1OQZSj+Nb9
	3VFhYAdgUSNUnUOu//QTUApAHSjXnQ/lGzba5TE=
X-Google-Smtp-Source: AOwi7QBVD91Lbec0K30atnXiO+Zx+btIRwR2WsnyD7IXAtMzbnd9HB0ioJmN+ArRzzq927IPgT/WmhdXNC+JJE63hJw=
X-Received: by 10.55.185.194 with SMTP id j185mr4743073qkf.101.1506200040319; 
	Sat, 23 Sep 2017 13:54:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Sat, 23 Sep 2017 13:53:59 -0700 (PDT)
In-Reply-To: <87r2uydicr.fsf@rkubodac-desk.ger.corp.intel.com>
References: <CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<87tvzylpvy.fsf@rkubodac-desk.ger.corp.intel.com>
	<20170920174336.GA19156@linux-uys3>
	<CAHUNapT7Hj4XjuJM_PzydckY=b+X5ok-p-k2MF3VYhywJ5mh5A@mail.gmail.com>
	<87r2uydicr.fsf@rkubodac-desk.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 23 Sep 2017 16:53:59 -0400
Message-ID: <CAHUNapRqoWWmi0_3whGpO14oMdXkRobsxi23xC2fxgXvwamHAQ@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Sat, 23 Sep 2017 20:53:59 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raphael,

On Fri, Sep 22, 2017 at 8:32 AM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> Can you try my recipe with master again? So far I've only tested pyro to
> avoid having the ground shift under my as I work on the recipe; I know
> that at least Chromium master builds fine with GCC 7, so any build
> errors caused by the compiler version are easily fixed with one or more
> backports.

This is tremendously awesome!! :-) I'm spinning up my builds as soon
and I've pressed "Send" :-D

