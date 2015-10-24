Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id F1D1A60034
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 05:04:03 +0000 (UTC)
Received: by ioll68 with SMTP id l68so143796181iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 22:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kA0i7smagIcpEHhF46Nc/f+/LAq0NAevl5uT2VSiwW0=;
	b=PbGvBDvLfaYQGvzrIEV/ZNrnVOQU678SeMqINyUtQ06hAWWF1j2TBeLZsvpQnO5qjO
	nZfQgMAfUKwb3KQYTUf3m37M4NG33qUdHmXd0g54OCd/73DUPbXs0QQ5aUvrNVwQvO+0
	bzJXwEP7e6A9pmOYiKOiipgTWrIPXPe03b0Voff2Q85DrogLZ01J9eC4B67Uh4w7SQvJ
	g44fCacbFIy7qSdmqI6QFO65R4uI2ElsEvkTvPUlDFty9i7PoOJ9Ho0Wojdd+SQAekvJ
	oBt3NjNnys7xQjlLJqTTKqmuBXgkA4dRX4Sr9r+1ScCTDJj5PapfiHrsQ1lL4ydBvnUM
	J/bw==
X-Received: by 10.107.137.66 with SMTP id l63mr24883248iod.112.1445663043663; 
	Fri, 23 Oct 2015 22:04:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 23 Oct 2015 22:03:34 -0700 (PDT)
In-Reply-To: <CAJ86T=UQNMedMzCVO8kYqGAc3uJRrCW4a_w7UhMT=4_D1_XvwQ@mail.gmail.com>
References: <CAJ86T=UQNMedMzCVO8kYqGAc3uJRrCW4a_w7UhMT=4_D1_XvwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Oct 2015 22:03:34 -0700
Message-ID: <CAMKF1sriTWU1=Ec7C_xL07HxN6gwT_H1PNEJ5htsiaODFaFOxw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] move ninja-native to meta-oe
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
X-List-Received-Date: Sat, 24 Oct 2015 05:04:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 23, 2015 at 9:08 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The are currently ninja-native recipes in meta-qt5 (v1.5.3) and
> meta-browser (v1.4.0).
>
> Any objections to me submitting patches to add a ninja-native v1.6.0
> recipe to meta-oe and remove the older recipes from meta-qt5 and
> meta-browser?

Just ensure that there are no dependency on particular version in either place

