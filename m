Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id ED06372667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 13:41:32 +0000 (UTC)
Received: by wggy19 with SMTP id y19so20447602wgg.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 05:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=4EvVhAec9UV95W4b90E9eQ5IoCnK+lEIvclNvjwSr/Y=;
	b=jiChvpruV2eR17CvOvSTK6+b3tQddLSGBRw2iEs+YQeoxb1StpVi3viNz3LQkIUNmx
	V7W87YUGhjSOiUqrF2w6i1sL7TrY2pEFD6p99SfzX5n7RP/P8GHK7Ptb1Y0jZrsIqyxx
	KMJwLo/O1bixebWIjR6DNU3A0LmNV9pydnuCdsNuynN+9gNHQUrpxExxAZhsrJsNW6mo
	CvFKBBP7P0L0vhLMEtB1pkqHk/KiLtMvaOrvpKC7OzYnz7TSdd58PC7TuPMEBnCYGUxP
	5hyc7Fl1XRQGJvx/F12K4TFyz717miEqy5GzH+FAcw3qljNEo2joF3koT0zgic2gGQQt
	VzZA==
MIME-Version: 1.0
X-Received: by 10.194.97.139 with SMTP id ea11mr1072370wjb.108.1425044493272; 
	Fri, 27 Feb 2015 05:41:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.27.11.18 with HTTP; Fri, 27 Feb 2015 05:41:33 -0800 (PST)
In-Reply-To: <20150227083113.GF2309@jama>
References: <54ED1B78.4040101@balister.org>
	<20150227083113.GF2309@jama>
Date: Fri, 27 Feb 2015 10:41:33 -0300
X-Google-Sender-Auth: MXj6h9_FYMMKfCj8okHj7cLIHGo
Message-ID: <CAP9ODKqFPNyF4ZoXv0C1Jw==opnmrj+cWAEHUhr6nXbbXUKw6g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
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
X-List-Received-Date: Fri, 27 Feb 2015 13:41:33 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

On Fri, Feb 27, 2015 at 5:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>> Please pull these three patches into meta-oe/dizzy.
>>
>> https://github.com/openembedded/meta-oe/pull/19
>>
>> These lead to a working PyQt4, which will reduce the number of questions
>> I get about gnuradio-companion not working on dizzy.
>
> I'm not sure if we should do upgrades in release branch which should
> receive only bug fixes, but I'll let daisy maintainers to decide.

I agree with your concern but I also see the improvement
(cross-compile support and like) of the new PyQt4.

At same time, I think this is not ready to be merged. Checking the
code changes I think we need to:

* split python-sip runtime package

This will fix the upgrade path.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

