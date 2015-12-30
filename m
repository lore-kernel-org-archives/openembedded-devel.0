Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 3169A60118
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:55:44 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id E6931280057
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:55:43 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <5683B31B.4090103@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5683B82F.7060003@topic.nl>
Date: Wed, 30 Dec 2015 11:55:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5683B31B.4090103@topic.nl>
Subject: Re: Why does samba think it (R)DEPENDS on perl?
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
X-List-Received-Date: Wed, 30 Dec 2015 10:55:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Found that the cause is "inherit cpan-base", this hardcodes "perl" into 
the package.

I think this requires a split-up of cpan-base.bbclass into two parts, so 
that one get obtain the perl version without adding these dependencies.

On 30-12-15 11:34, Mike Looijmans wrote:
> When building the current version of samba, it builds perl and drags it
> into the image through an RDEPENDS.
>
> I've been researching this for a while, but failed to figure out what
> causes this runtime relation. Is there a way to find out where this is
> being "detected"?
>
> The workaround I implemented is simply adding this line to the samba
> recipe, which at least gets rid of the overhead in the image:
>
> RDEPENDS_${PN}_remove = "perl"
>
> (Samba 4 is bloated enough by itself, it doesn't need other packages to
> inflate its runtime even more)
>


-- 
Mike Looijmans

