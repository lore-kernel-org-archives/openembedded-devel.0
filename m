Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LpJs8-00048c-7E
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 12:10:13 +0200
Received: by ewy20 with SMTP id 20so458192ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 03:07:41 -0700 (PDT)
Received: by 10.216.47.16 with SMTP id s16mr2968473web.16.1238666861710;
	Thu, 02 Apr 2009 03:07:41 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 5sm1234512eyf.32.2009.04.02.03.07.40
	(version=SSLv3 cipher=RC4-MD5); Thu, 02 Apr 2009 03:07:41 -0700 (PDT)
Message-ID: <49D48E6C.7070304@xora.org.uk>
Date: Thu, 02 Apr 2009 11:07:40 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <12386320381719-git-send-email-clarson@mvista.com>
In-Reply-To: <12386320381719-git-send-email-clarson@mvista.com>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] bitbake.conf, collections.inc: Add COLLECTIONS mechanism w/ a sane default.
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
X-List-Received-Date: Thu, 02 Apr 2009 10:10:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> Added code which takes a list of directories in COLLECTIONS, in priority
> order (highest to lowest), and uses those to populate BBFILES,
> BBFILE_COLLECTIONS, BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
>
> The default COLLECTIONS is based on BBPATH, so you can now specify a sane
> BBPATH, not bother setting up the collections variables or BBFILES, and
> still likely be able to do a build.
>
>   
I haven't had time to test the patch, but I really like the idea of
this. Also the archives part as well. This will make setup so much
easier for people wanting to overlay. And improve the ability for OE to
be shipped in setup scripts.

Graeme



