Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSlqz-0007Op-Nl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 10:41:53 +0100
Received: from localhost ([127.0.0.1]:44617 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSldr-0006rZ-Uq
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 09:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=s86ij1n39OdHbR7S2tuRYtBKxcs=; b=OgKuu+/T8gWyr/sRXf2jVEJ9ACrB
	sMBQcRm0l6wlP2uuHrj9OxbNuETbQDAuL+f4g4RVNJfytYAIXZqMOiqk+8ukTsy9
	qyjkzMEIniNHKwSQqbwjloxrQJ7BS6EOwAta/B9WEnjMEZbUxhCCNFOrtP/5o2in
	d7dS3i4QOPxKLl8=
Received: from [195.171.99.130] (port=22063 helo=[192.168.0.60])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSldr-0006rV-Rt
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 09:28:19 +0000
Message-ID: <508E4CAB.8070407@communistcode.co.uk>
Date: Mon, 29 Oct 2012 09:30:19 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351502894-2303-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1351502894-2303-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [PATCH 0/3] Improve x11 distro_feature checks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 09:41:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/12 09:28, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Improvement to the detection of the x11 distro_feature in a few recipes
> with the final achievement being that GTK+ is no longer required in
> core-image-minimal if dbg-pkgs, tools-profile and tools-debug are enabled
> when x11 is not in distro_features.
>
> V2
>
> Added PR bumps to all recipes
>
> Jack Mitchell (3):
>    latencytop: disable GTK and remove gtk+ dependacy
>    packagegroup-core-tools-profile: include sysprof only if x11 is
>      distro feature
>    babeltrace: fix depends
>
>   .../packagegroups/packagegroup-core-tools-profile.bb        |  4 +++-
>   .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
>   meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  6 ++++--
>   meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb            |  2 +-
>   4 files changed, 15 insertions(+), 10 deletions(-)
>

Please ignore, sent to wrong list inerror.

Need more tea.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



