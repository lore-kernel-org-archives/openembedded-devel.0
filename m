Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm3Ab-0003qq-6O
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:01:49 +0100
Received: from mail-yh0-f71.google.com ([209.85.213.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:47:02 -0800
Received: by mail-yh0-f71.google.com with SMTP id j63so6535806yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=fXP1EKjirNuda7ThPyoY/8KH6/WxbwTqmQzgaBoGn9Y=;
	b=dNeNPZ/bjl0MGlwyxmRwpKmb2J7O470TMBBZiLWMutNlk+JfX8myHjg6Rayudpm0FD
	TZ4ABpaR8oFGpx7eR98ic4T/MUFpTSNuYBKeYXrHyDfxB6BTM6blspAh31BPvsW8MNPn
	PPCeZIVzxOW+XKUsax9h6wYYfjeKCTRv8qLZeaR6wXL9yOf19ilF9j6k6lWANHvkRV2I
	/6VIAGZjtCIdlURf4xuc81/ERE2PdvMUYwaEB1I3WqzzwsA7ftg7FGEVJkPEUoas9KEC
	dBT+X919wIbWwfXdSwuJ0ZSWa5BgfsWO6pdGubJ9bMXjS8rEm7Syngj148c8xkoO/8Mt
	P7VQ==
X-Received: by 10.58.127.195 with SMTP id ni3mr20655102veb.30.1356097621733;
	Fri, 21 Dec 2012 05:47:01 -0800 (PST)
Received: by 10.58.127.195 with SMTP id ni3mr20655089veb.30.1356097621601;
	Fri, 21 Dec 2012 05:47:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 05:46:41 -0800 (PST)
In-Reply-To: <CAJTo0LadHbaD1iA7TXRS25EZbV4dbH5Q62mbSJEDZvxEqju+LA@mail.gmail.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
	<1356007963-12208-2-git-send-email-ross.burton@intel.com>
	<20121221094318.GQ14543@jama.palm1.palmone.com>
	<CAJTo0LadHbaD1iA7TXRS25EZbV4dbH5Q62mbSJEDZvxEqju+LA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 13:46:41 +0000
Message-ID: <CAJTo0LYYRbS5waZR7ErhsWodyaamQtn27=GEN1wv+deRV19aCw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQki5DJfAJYbvlG0YGOCrn0tRK5/loTw46in9Q5BcK7LJqyBJi5NhuxxknL/87nD+Xv145Jr2XOkKOgPpwN0dWcdaSZPRZTi/RpvEH0D01O6vjCQmXirxB1E5k+nmDuvv6bdD1VzFrrI6dXoyXIZYxjOWp/xoTO74gvATf58uOkD0zfbBhBweXOKniOwPjkS4ikiC7Sy
Subject: Re: [meta-multimedia PATCH 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Fri, 21 Dec 2012 14:01:49 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 12:36, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 December 2012 09:43, Martin Jansa <martin.jansa@gmail.com> wrote:
>> vala-stub-native does not exist afaik, why not use vala-native?

V2 sent, Vala is a pointless dependency for the GUPnP stack as it
requires gobject-introspection first, so we'll be building vala just
to get an autoconf macro that is never used.

Avoid the vala-stub debate now by simply commenting out that macro for now.

Ross


