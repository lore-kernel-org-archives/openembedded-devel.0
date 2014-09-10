Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Sep 2014 17:18:41 UTC
Received: from smtp04.online.nl (smtp04.online.nl [194.134.41.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE3371321
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 17:18:41 +0000 (UTC)
Received: from smtp04.online.nl (localhost [127.0.0.1])
	by smtp04.online.nl (Postfix) with ESMTP id 7FF5AE287
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:08:38 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.online.nl (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:08:38 +0200 (CEST)
Message-ID: <54108595.6080809@topic.nl>
Date: Wed, 10 Sep 2014 19:08:37 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1410279874.git.liezhi.yang@windriver.com>
	<63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>
In-Reply-To: <63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>
X-Online-Scanned: by Cloudmark authority (on smtp04.online.nl)
Subject: Re: [PATCH 02/14] autofs: add bash to RDEPENDS_autofs
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
X-List-Received-Date: Wed, 10 Sep 2014 17:18:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Wouldn't it be a LOT more constructive to fix the bashism. I fail to see 
the virtue in adding 2MB of "bash" to an embedded system just for a text 
echo statement that no-one will actually read unless they hook up a 
serial console to their TV set or so.


On 9-9-2014 18:27, Robert Yang wrote:
> Bashism:
> [snip]
> possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be eval_gettext "foo"):
>                  echo $"$prog not running"
> possible bashism in autofs/etc/init.d/autofs line 120 ($"foo" should be eval_gettext "foo"):
>                  echo $"Reloading maps"
> possible bashism in autofs/etc/init.d/autofs line 150 ($"foo" should be eval_gettext "foo"):
>                  echo $"Usage: $0 {start|forcestart|stop|restart|forcerestart|reload}"
> [snip]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../recipes-daemons/autofs/autofs_5.1.0.bb         |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> index aab2187..06ee77b 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
> @@ -4,6 +4,7 @@ LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
>   DEPENDS += "libtirpc flex-native bison-native"
> +RDEPENDS_${PN} += "bash"
>
>   inherit autotools-brokensep systemd
>
>


-- 
Mike Looijmans

