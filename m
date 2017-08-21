Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8764577CF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:16:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L2G141000684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 19:16:02 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 20 Aug 2017 19:16:01 -0700
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1503197508-211426-1-git-send-email-zhixiong.chi@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <aeb82095-e155-f526-73a3-6f8259375ad9@windriver.com>
Date: Mon, 21 Aug 2017 10:20:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1503197508-211426-1-git-send-email-zhixiong.chi@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [meta-oe][PATCH] rsyslog: CVE-2015-3243
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
X-List-Received-Date: Mon, 21 Aug 2017 02:16:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2017 10:51 AM, Zhixiong Chi wrote:
> rsyslog uses weak permissions for generating log files, which allows
> local users to obtain sensitive information by reading files in
> /var/log/cron.log
>
> We add "create 0600 root root" to the /etc/logrotate.d/syslog file,
> this will ensure the file is created with permissions when logrotate
> runs. It is also recommended that users manually set the permissions
> on existing or newly installed log files in order to prevent access
> by untrusted users.
> https://bugzilla.redhat.com/show_bug.cgi?id=1232826
>
> CVE: CVE-2015-3243
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> index 94ec517..7960815 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> @@ -23,6 +23,9 @@
>   /var/log/user.log
>   /var/log/lpr.log
>   /var/log/cron.log
> +{
> +        create 0600 root root
> +}
>   /var/log/debug
>   /var/log/messages
>   {


Hi Zhixiong,

I also did some testing about this issue.

We use '0640' for these log files, owner is root and group is adm. So 
they are not world readable.

And I also tried logroate command on target to recreate these log files. 
They are created with 0640 file permission. (I checked the conf files, 
not sure why 0640 is used by default.) You could double check it if you 
like.

(I used 'logroate -f /etc/logroate.conf' command to do the test.)

P.S. Even if we want to do something, we should use 'create 0640 root adm'.

Best Regards,

Chen Qi


