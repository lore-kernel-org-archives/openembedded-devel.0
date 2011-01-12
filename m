Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pd7WS-0003Du-HV
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:42:24 +0100
Received: by pwi8 with SMTP id 8so162601pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 12:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=56XC88HKuff0kO64JV1zgoEMt7otTT57Rvpj6V6d1B4=;
	b=d02Gh22V8nafn9AMoz9wYE5peVierS1HJwW4Ao9+kyRMvteeMv5pjLJ/S6GTJ2cpCg
	XrWUMGqNj3So/jumhZ9HF5fQle5U60kUj9PVYz0NH5Mp8+Bi+tEXjKXuBSIsnc3o17IQ
	C0JuM5oTKAm/6WN7zpZOtQSUKQKgxiMpKuXJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=uNTwHpusNHeutVH1A56TWMl0m8Z2f3tK9Au5EPbe2dAu4b+BsfkNP05n9YtvnaSdKV
	MK4RApBQs8c50eEII8dDBG5A7GV22gUkK+Cf6ansUHKQ2FLnRg2CQly3ZOjn/VPfolYW
	IrxpGDfdC1TibCJCdjpItxD/ulymUtGi9kqyc=
Received: by 10.142.48.9 with SMTP id v9mr198500wfv.170.1294864909906;
	Wed, 12 Jan 2011 12:41:49 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm1311530wfd.1.2011.01.12.12.41.47
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Jan 2011 12:41:48 -0800 (PST)
Message-ID: <4D2E1209.1090805@gmail.com>
Date: Wed, 12 Jan 2011 12:41:45 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
Subject: Re: [PATCH 0/3] autotools.bbclass misc trivia
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
X-List-Received-Date: Wed, 12 Jan 2011 20:42:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/2011 12:15 PM, Bernhard Reutner-Fischer wrote:
> Hi,
>
> In an isolated test with dash and busybox ash the AC_CONFIG_MACRO_DIR
> patch works as expected. Testers welcome.
>
> Bernhard Reutner-Fischer (3):
>    autotools.bbclass: pass distro_imposed_configure_flags
>    autotools.bblass: mkdir also AC_CONFIG_MACRO_DIR
>    autotools.bbclass: use grep -q
>
>   classes/autotools.bbclass |   29 ++++++++++++++++++++++++-----
>   1 files changed, 24 insertions(+), 5 deletions(-)
>
Whole series

Acked-by: Khem Raj <raj.khem@gmail.com>


