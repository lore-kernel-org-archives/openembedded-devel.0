Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ORTZX-0005WH-Nx
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:17:13 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ORTV3-0001Ca-2p from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 10:12:33 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 23 Jun 2010 10:12:32 -0700
Received: from [172.30.80.125] ([172.30.80.125]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 23 Jun 2010 11:12:31 -0600
Message-ID: <4C22407B.4060309@mentor.com>
Date: Wed, 23 Jun 2010 10:12:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
In-Reply-To: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
X-OriginalArrivalTime: 23 Jun 2010 17:12:31.0920 (UTC)
	FILETIME=[441D8B00:01CB12F7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 0/3] Recipe for MuPDF
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
X-List-Received-Date: Wed, 23 Jun 2010 17:17:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Artamonow wrote:
> As there's no more comments on original patch series[1], guess it's time
> to send v2. Do whatever you like with these patches :-)
> 
> [1] http://patchwork.openembedded.org/bundle/mad_soft/mupdf-0.6-v1/
> 
> Changelog v1 => v2:
> 
> * removed autotools_stage_all from openjpeg and jbig2dec recipes,
>   as suggested by Khem Raj
> * used upstream patch fixing endianness issues on 16-bit displays
>   instead of custom hack (upstream has been very kind to fix this
>   bug so quickly)
> * more verbose comment about why we need -O2

Was this answered before?  Why is everything in a '-tools' package?  It 
looks like we have empty main packages and populated '-tools'.

-- 
Tom Rini
Mentor Graphics Corporation


