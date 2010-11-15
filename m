Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PI1EI-0005bD-AA
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 16:44:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5716D8EDB10;
	Mon, 15 Nov 2010 10:43:23 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21244-01; Mon, 15 Nov 2010 10:43:23 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D83758DA324;
	Mon, 15 Nov 2010 10:43:20 -0500 (EST)
Message-ID: <4CE15518.6040800@cbnco.com>
Date: Mon, 15 Nov 2010 10:43:20 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: dvorkin@tibbo.com, openembedded-devel@lists.openembedded.org
References: <1289772538-492-1-git-send-email-dvorkin@tibbo.com>
In-Reply-To: <1289772538-492-1-git-send-email-dvorkin@tibbo.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pstree: added receipt pstree: added shorewall: updated to 4.2-shell and 4.4-perl versions
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
X-List-Received-Date: Mon, 15 Nov 2010 15:45:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Dvorkin Dmitry wrote:
> Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
> ---
>  recipes/pstree/pstree.inc                   |   17 +++++++++++++++++
>  recipes/pstree/pstree_2.33.bb               |    8 ++++++++
>  recipes/shorewall/shorewall-deps.inc        |   20 ++++++++++++++++++++
>  recipes/shorewall/shorewall-shell_4.2.11.bb |   14 ++++++++++++++
>  recipes/shorewall/shorewall.inc             |   17 +++++++++++++++++
>  recipes/shorewall/shorewall_4.4.14.bb       |   12 ++++++++++++

Please split the pstree and shorewall changes into two separate patches.

For pstree, there's no need for a .inc as likely only one version will 
be in the tree at a time.

For shorewall, please use INC_PR. e.g. set INC_PR = "r0" in 
shorewall.inc and set PR = "${INC_PR}.0" in the recipes which include it.

Thanks,
Mike


