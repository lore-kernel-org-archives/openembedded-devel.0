Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 2394 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Mar 2020 12:20:17 UTC
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 50EC660706
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 12:20:17 +0000 (UTC)
Received: from [127.0.0.1] (port=57780 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>) id 1j8jQt-007mb6-6j
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2020 06:40:24 -0500
Received: from [66.129.241.14] ([66.129.241.14]) by crashcourse.ca (Horde
	Framework) with HTTPS; Mon, 02 Mar 2020 06:40:23 -0500
Date: Mon, 02 Mar 2020 06:40:23 -0500
Message-ID: <20200302064023.Horde.ysbjnASrU_28GwKCJ5dLyb-@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-devel@lists.openembedded.org
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: error in meta-oe "indent" recipe file -- absolute path for FILES_${PN}-doc"
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
X-List-Received-Date: Mon, 02 Mar 2020 12:20:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


from indent_2.2.12.bb (master):

layer i'm currently perusing applies this patch for indent, with the  
comment that this current error breaks extending this recipe to  
"nativesdk":

FILES_${PN}-doc += "${prefix}/doc/indent/indent.html"
FILES_${PN}-doc_remove = "/usr/doc/indent/indent.html"

certainly seems reasonable to fix this ... should i submit a patch?

rday


