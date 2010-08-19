Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Om4P8-0002Xn-Sx
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 14:39:38 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 5A10A323
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 08:39:07 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 19 Aug 2010 08:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=LrwF/eUxXb9FeCOxZg2G21CnhTY=;
	b=FtVVdGbCy4r3noW9r/lucs4zsCiYrK8lAthbJaHy4Q09L7BuwmdtaU7rKIw/D1V2Qyfj+sBPGfUnnFPh6SIOaDwOxzJgNZe4cWHbTpWo+jD/y96H1/o3q7mxTCkcjx+zX1L8llR9fGs7EA90s7QL3kkDgBXDHlVY1zXSN1xJs8o=
X-Sasl-enc: YR6WU25xL+JcYJF5FiyohqfB/CIFx/If+9y+9X9XlKtF 1282221546
Received: from [192.168.1.34] (hnvr-4d07974b.pool.mediaWays.net [77.7.151.75])
	by mail.messagingengine.com (Postfix) with ESMTPSA id C9EDB5E6906
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 08:39:06 -0400 (EDT)
Date: Thu, 19 Aug 2010 14:40:44 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Thu, 19 Aug 2010 12:39:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Sun, 15 Aug 2010, Frans Meulenbroeks wrote:

> I've made a list of patch files in recipes (prefixed with file://) and
> compared it with the list of patch files as appear on disk.
> Below is the list of 645 files that do not show up in any recipe and
> as such can be considered as orphaned.
> Proposal is to remove these files after double checking that they are
> indeed not used.
>
> Do people agree with this? If so can I have an ack?
>
> And do we want to have a commit for every file (makes it easy to
> revert an error) or a big commit with all removals?
> (removals per dir are also possible but that process is more difficult
> to automate and hence not my preferred solution.
>
> Your opinion is appreciated.
>
> Frans

Hello Frans,

how did you create that list?  As I see it, there must be an error in the 
analysis somewhere:

> htmldoc paths_1.8.27.patch


vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$ fgrep -C 1 paths_1.8.27.patch *
htmldoc_1.8.27.bb-SRC_URI = "http://..../htmldoc-${PV}-source.tar.bz2 \
htmldoc_1.8.27.bb:file://paths_1.8.27.patch"
htmldoc_1.8.27.bb-
--
htmldoc-gui_1.8.27.bb-SRC_URI = "http://..../${PV}/htmldoc-${PV}-source.tar.bz2 \
htmldoc-gui_1.8.27.bb:file://paths_1.8.27.patch"
htmldoc-gui_1.8.27.bb-
--
htmldoc-native_1.8.27.bb-SRC_URI = "http://.../htmldoc-${PV}-source.tar.bz2 \
htmldoc-native_1.8.27.bb:file://paths_1.8.27.patch"
htmldoc-native_1.8.27.bb-
vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$ find . -name paths_1.8.27.patch
./files/paths_1.8.27.patch
vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$


Best regards,
    Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


