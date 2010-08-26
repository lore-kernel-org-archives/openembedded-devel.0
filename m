Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OokjS-0006dl-2I
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:15:39 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ookiy-0005aU-V9 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 15:15:08 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 26 Aug 2010 15:15:08 -0700
Received: from [172.30.80.146] ([172.30.80.146]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 26 Aug 2010 16:15:07 -0600
Message-ID: <4C76E762.4030307@mentor.com>
Date: Thu, 26 Aug 2010 15:14:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282858170-31241-1-git-send-email-eric@eukrea.com>
	<1282858170-31241-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1282858170-31241-2-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 26 Aug 2010 22:15:07.0577 (UTC)
	FILETIME=[242AF290:01CB456C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ncurses-5.7 : fix sdk build
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
X-List-Received-Date: Thu, 26 Aug 2010 22:15:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:

> @@ -170,7 +170,7 @@ pkg_prerm_ncurses-tools () {
>          fi
>  }
>  
> -BBCLASSEXTEND = "native sdk"
> +BBCLASSEXTEND = "native nativesdk"

Don't remove sdk from here, just add nativesdk.  We haven't fully 
converted everything.

-- 
Tom Rini
Mentor Graphics Corporation


