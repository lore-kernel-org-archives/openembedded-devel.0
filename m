Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PoH15-0002tz-8O
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 16:04:07 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PoGzz-0007e1-Dm from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 07:02:59 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 12 Feb 2011 07:02:59 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 12 Feb 2011 08:02:58 -0700
Message-ID: <4D56A11A.9050703@mentor.com>
Date: Sat, 12 Feb 2011 08:02:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297244237-9508-1-git-send-email-javier.martin@vista-silicon.com>
	<1297244237-9508-7-git-send-email-javier.martin@vista-silicon.com>
In-Reply-To: <1297244237-9508-7-git-send-email-javier.martin@vista-silicon.com>
X-OriginalArrivalTime: 12 Feb 2011 15:02:58.0470 (UTC)
	FILETIME=[EF70B460:01CBCAC5]
Subject: Re: [PATCH 6/7] Add new specific package for Visstrim_M10 board.
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
X-List-Received-Date: Sat, 12 Feb 2011 15:04:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 02:37 AM, Javier Martin wrote:
> This visstrim-m10-utils package includes a preinit script for
> Visstrim_M10 boards and the commands "save_config" and
> "default_config" which write volatile directories to a
> non volatile storage.
[snip]

> +++ b/recipes/visstrim-m10-utils/visstrim-m10-utils_0.1.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Visstrim_m10 set of scripts to allow squashfs+jffs2 schema"
> +SECTION = "base"
> +PRIORITY = "required"
> +LICENSE = "TODO"

Please re-submit with a valid license field here.

> +FILES_${PN} = "/"

This shouldn't be needed as /sbin and /usr/sbin are in the default glob.

-- 
Tom Rini
Mentor Graphics Corporation


