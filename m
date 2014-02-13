Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2F76E894
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 10:40:16 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z6so9974673yhz.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=uyTQes017URPRgftt7iy31zR2FbqT73GAsacGi8mc4A=;
	b=ckK7iTAFuwJqEmAgJt1IERu58YJkm2YBPk6fTHl/gZ5dOde/rfrFDxmcUtmQWc785z
	4zGOu6E9s+2+ryvLOMIeo869Oqk5jTbKqn8Up7g+6gRjH+P5yiwhCt4M9s49wuL3DEom
	LiipHV60BhHMPJnQ6TkAJ0nNZycf2NHl+KJcx0IYinGvQ2mMKlKB+a4VM7A20zuK64BC
	fYeWfvVUYC8uFviXoILgqC40lPoVTkAoen2ZIj4Z8ZK+09ZesbJ9qRS3cu/14XodP1wg
	F/sCARSODwLlc0B3TBbXz00T7odnmWGHUT+5rzvoLAo0S7fGfQSazGCPsv4GaMA4feSy
	9u8Q==
MIME-Version: 1.0
X-Received: by 10.236.139.234 with SMTP id c70mr684612yhj.26.1392288017420;
	Thu, 13 Feb 2014 02:40:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Thu, 13 Feb 2014 02:40:17 -0800 (PST)
In-Reply-To: <52FC361E.4030708@windriver.com>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
	<CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
	<52FC361E.4030708@windriver.com>
Date: Thu, 13 Feb 2014 08:40:17 -0200
X-Google-Sender-Auth: Zqs2nNmf_IiAqQiQkKrYrmNaevs
Message-ID: <CAP9ODKoWiCTHvBbDaupueGM5buzvGTG6fYSrZ2+eTipmpDMVyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Thu, 13 Feb 2014 10:40:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 13, 2014 at 1:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 01/22/2014 10:21 PM, Otavio Salvador wrote:
>>
>> On Mon, Jan 20, 2014 at 10:52 AM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>> The $(subdirs) contains all the dirs under the ${B}, and this one:
>>>
>>> do_unpack[cleandirs] = "${S}/patches"
>>>
>>> will create a "patches" dir, then there will be compile errors, filter
>>> out the patches will fix the problem.
>>>
>>> Note: poky doesn't have this problem since it separates the ${S} and
>>> ${B}
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>>
>> Couldn't we change it for OE-Core as well? So we avoid having to patch
>> the build system.
>>
>
> I'm sorry, I don't quite understand what do you mean, this patch didn't
> change the build system, it changed the Make.rules.


To be sincere I didn't understand my comment as well ...  don't recall
what I thought... I'd say to ignore it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

