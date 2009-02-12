Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXfU4-0006cx-4h
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 18:36:20 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXfSp-0003J8-54
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 17:35:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:35:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:35:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 18:26:21 +0100
Message-ID: <gn1m3u$5tl$4@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 4/6] parted: drop versions up to 1.8.8
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
X-List-Received-Date: Thu, 12 Feb 2009 17:36:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 17:38, Otavio Salvador wrote:
> Versions older then 1.8.8 are not maintained upstream and looks to
> have no users inside of OE hence makes no sense to be kept.

> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -16610,26 +16610,6 @@ sha256=211a0092cfd50923eaad75c20630c0a1818e56605d4b6fbc10702d5a34ea7107
>   md5=129f8623dc4f70188a015e3cbd7eae82
>   sha256=74188aff5f2e5b77515a8cf3979199a598d58da8e4f573462b59cbf94cf1c99d
>
> -[ftp://ftp.gnu.org/gnu/parted/parted-1.6.23.tar.gz]
> -md5=7e46a32def60ea355c193d9225691742
> -sha256=5144f413dcce1a0b94263ebf3730f2a2afe6a9557bf261f9d6f48c890423f4c8
> -
> -[ftp://ftp.gnu.org/gnu/parted/parted-1.6.25.1.tar.gz]
> -md5=8ad8b2c8aa865d9d6a43a4ecfe021782
> -sha256=b8f151450dc71e2477d44b7f9ebb77a9ccf8d08776b77edb9bddee07885f1b02
> -
> -[ftp://ftp.gnu.org/gnu/parted/parted-1.8.0.tar.gz]
> -md5=52d3e565fc3369d3388a9e02d4b17410
> -sha256=6c57feb082c23e52f38366fff4ffa3961e5dc294d4ebb61ffa31462b5ae3681e
> -
> -[ftp://ftp.gnu.org/gnu/parted/parted-1.8.2.tar.gz]
> -md5=cce5bce8fa1d430e1ca3de3722807e01
> -sha256=2f67c40e2589e7804213493f24ebf80cd10847b47c95098854db0250511c3ed1
> -
> -[ftp://ftp.gnu.org/gnu/parted/parted-1.8.7.tar.gz]
> -md5=2ec5cb88b146f1a8ccd5b389455503c6
> -sha256=bffb732ab47a8dfb528ab2513f6ae82a4f795c119decfe1f96310bf32c4dfc9e

There's no point in deleting things from checksums.ini, they get added 
back once someone uses the .ini in TMPDIR to add checksums.
Otherwise, the patch looks ok.

regards,

Koen



