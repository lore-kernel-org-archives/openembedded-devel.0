Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id EBF3C731DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 01:01:30 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id q2so24716837obl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 17:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hCs2Th4yjfnGj+bf6yWIR2mQSIhi1TvxI4QHGXBou/U=;
	b=PxsXIfgUm+5m9JHdDC4I/ReFkyQefvZOl+uWAXOuVwg6QCU5lZ7k3UNZWRtgFaRCYF
	he75e7vFHubgWbH6Nh+e0TutpmqmEOCfqSbrZgsfDwtghTk9q/cstAGnllkI7WAzzyzv
	BaopiF1hzfXQ8u3J/wk6CR7+6kkcLt5tU9jNuAz5i4LrB7UXDXjF7kLtps5OnRVMzq+j
	140+S+OdYUAY5ReBEc8vuv+a8Bk3ATGz+fVN+vvd1oYzScE5KmKdz4jOQhgXWH8oCq4C
	d424/UadOi3sCgIY8DJaXY6kUl9nnKiHdlF98qmk3dQnu0blhqTlK+yTO2nfZQSxFzLH
	nYyw==
MIME-Version: 1.0
X-Received: by 10.60.33.10 with SMTP id n10mr66770319oei.66.1452042091259;
	Tue, 05 Jan 2016 17:01:31 -0800 (PST)
Received: by 10.182.165.230 with HTTP; Tue, 5 Jan 2016 17:01:31 -0800 (PST)
In-Reply-To: <568C3DD8.9020604@gmail.com>
References: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
	<CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E4E724@OLAWPA-EXMB03.ad.garmin.com>
	<9EE300C1-F57A-461C-8B5C-011C6750DF64@gmail.com>
	<CAOLEWZWrT7xz1de_tf-XvjQ342L_Tu1Wrm0VjJd4rXsF60gksg@mail.gmail.com>
	<568C3DD8.9020604@gmail.com>
Date: Tue, 5 Jan 2016 17:01:31 -0800
Message-ID: <CAOLEWZX1hDw2rHWutakNUkpzgTO=UW0ZOUDwUzvuVmd8fp55pg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Wed, 06 Jan 2016 01:01:31 -0000
Content-Type: text/plain; charset=UTF-8

I never said my vote counted...  ;)  But we do have it in "system" in
Gentoo as the default in all the stage builds.  So for me I'd like any
image with a network interface to Just Work using the (sometimes very)
basic manual readme steps in random BSP layers with minimal deps.  And
I haven't seen one yet with a bitbake-layers add-layer step to add
networking...

Steve

On Tue, Jan 5, 2016 at 2:04 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On 01/05/16 16:55, Stephen Arnold wrote:
>> My vote would be whatever is the most stable/reliable should be in
>> the core layers rather than an "extra" layer people need to add to
>> bblayers manually.
>
> But there's always "bitbake-layers add-layer" and "bitbake-layers
> layerindex-fetch" to help :-)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

