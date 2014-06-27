Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 537 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jun 2014 14:28:22 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 7913F65F1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 14:28:22 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D80382232CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 16:19:22 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id F329D2232CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 16:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (91-65-194-134-dynip.superkabel.de
	[91.65.194.134]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 16:19:21 +0200 (CEST)
Date: Fri, 27 Jun 2014 16:19:15 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140627141915.GA23711@mail.itconsulting-heinold.de>
References: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C430@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612C63E@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0612C63E@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Building Java 7
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
X-List-Received-Date: Fri, 27 Jun 2014 14:28:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2014 at 01:53:27PM +0000, MONDON Daniel wrote:
> >Hi,
> >
> >I'm back building Java 7 for Arm. (what about Java 8?)
> >
> >
> >I've got the error : :(
> >WARNING: Failed to fetch URL https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip, attempting MIRRORS if available
> >ERROR: Fetcher failure: Fetch command failed with exit code 4, output:
> >OpenSSL: error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert handshake failure Unable to establish SSL connection.
> >
> >ERROR: Function failed: Fetcher failure for URL: 'https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip'. Unable to fetch URL from any source.
> >ERROR: Logfile of failure stored in: /home/me/poky/build/tmp/work/x86_64-linux/rhino-native/1.7r4-r0/temp/log.do_fetch.24461
> >ERROR: Task 1806 (virtual:native:/home/me/poky/meta-java/recipes-core/rhino/rhino_1.7r4.bb, do_fetch) failed with exit code '1'
> >NOTE: Tasks Summary: Attempted 1211 tasks of which 1183 didn't need to be rerun and 1 failed.
> >
> >With the log file joined.
> >
> >Thanks,
> >Daniel.

No,

might be an error related to the openssl heartblead bug. You can try to download the zip file manually.


Bye Henning

