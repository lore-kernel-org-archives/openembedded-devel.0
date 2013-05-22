Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1031560984
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 14:02:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4ME2fcw018140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 07:02:41 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 22 May 2013 07:02:40 -0700
Message-ID: <519CCFFF.2060506@windriver.com>
Date: Wed, 22 May 2013 09:02:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
In-Reply-To: <CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 14:02:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 5/22/13 3:31 AM, Andreas Müller wrote:
> On Tue, May 21, 2013 at 9:36 PM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
>> OpenEmbedded Technical Steering Committee
>> 7 May 2013
>>
>> Attendees:
>>    Koen (koen)
>>    Khem (khem)
>>    Fray (fray)
>>    Paul (bluelightning)
>>    Richard (RP)
>> Apologies:
>>
>> Notes: Jefro
>>
>> Agenda at a glance:
>>
>> 1. pick a chair
>> 2. new issues
>> 3. lingering issues
>> a. systemd merge unhappiness
>> 4. projects in progress - status
>> a. oe-classic recipe migration status
>> b. oe-core release
>> c. systemd into master
>> d. meta-oe appends/overlayed recipes RFC
>> e. 1.5 planning
>> 5. infrastructure
>> a. mailing list moving to YP server, in progress
>> b. oe.org flooded
>> 6. projects deferred
>> a. raise awareness of "janitor" list, QA "bugs"
>> b. document whitespace changes to the shell
>> c. raise ntp with the Yocto Project [RP]
>>
> There are three issues I would like to comment on:
>
> 1. systemd migration:
>
>  From what I see the only major step left over is to bury meta-systemd.
> The only appends found there are those for oe-core. I asked for this
> long time ago [1] and support was offered but...
>
> 2. indention:
> Reading between the lines there is some unhappiness on meta-oe using
> four spaces for shell and python code. I personally agree with Martin
> here because I have not seen a technical reason for shell requiring
> tabs so far. To me this looks like a style decision which increases
> the burden to submit for low-skilled people like me. Could somebody
> please enlighten me: For what technical reason do we need tabs in
> shell code?

(Background) When the spacing was decided, looking at the existing OE recipes 
and classes, the majority of things were indented such that python used tabs, 
and recipe (shell scripting) used spaces.  During the cleanup of the scripting 
sections it was decided that the least impact to all was desirable.  Thus the 
python-tab, shell-spaces convention.

It's true that shell scripts don't really care about indenting, so the four 
spaces is just a convention that was decided on based on that.  The concern is 
that if we go in and change the convention now, it's going to cause a lot of 
potential disruption.

So the answer isn't that it's a technical reason, it's a community reason. 
Don't rock the boat on something that is just going to annoy people and provide 
no actual help.  So far I haven't seen a compelling argument to change the 
convention BTW, other then (paraphrase) "I don't like spaces, and want to use 
tabs".  (Note, when I write shell scripts, I prefer tabs as well..)

--Mark

> 3. xserver-nodm-init oe-core vs. meta-oe
> This is a long lasting issue and Martin commented on why there is a
> different approach in meta-oe [2]. One blocker for progress is xinput
> calibrator rework. Short story: I have a solution working here which
> is capable of starting calibrator by udev/systemd and can be invoked
> by an unprivileged user at any time. Unfortunately this solution has
> still too many issues to be submitted and from what I see now I won't
> find the time to fix them in the next future. So if anybody wants to
> unify xserver-nodm-init - feel free. Users can add xserver.common to
> images manually (and xinput calibrator is not really working anyway).
>
> If I could I would add an additional item on the agenda:
>
> gtk3-migration:
> In meta-gnome we are working with terribly old gnome recipes. These
> needed much backporting efforts to survive glib-2.36 / gcc 4.8 updates
> - and I don't think this increases code quality in any way - so it is
> more or less a useless effort which we will continue.
>
> * Are there plans for a step-by step migration? A good starter would
> be to solve libnotify 2/3 API issue. Is anybody else working on this /
> thinking about?
> * Are there plans to update gtk3 to 3.8.x to have wayland support?
>
> Cheers
>
> Andreas
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2013-January/073596.html
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2013-February/075336.html
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


