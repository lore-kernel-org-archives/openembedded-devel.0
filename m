Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P5xGC-0001tb-8T
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 11:04:33 +0200
Received: by ewy1 with SMTP id 1so1490508ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type;
	bh=utOqUHSeSHvUJidEdh7F41GiZBWLu5DJ46ZBlSvFF2I=;
	b=B5YhrOzmDSePx7oNQgMo4UfExZz4+HdoKLGbeioiXBK95FnS6Wk6J39O0BKrVBGHYf
	N0VdOKHLDadHuvsoz9xUU5y091oMDkkZo+SfdCqeGy9ohKZjWVi4iHtdMm0rGDe6wJf1
	1d/5NRShmxPsMk69RQvhVDGXkbKUbrWUZz+Zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type;
	b=tPaoumbmRr99Cf8Ed0NDUrRbihikVjofkFw3ewh1mZBt/vlx+mn1LaEJJLZjgy5KCZ
	XZ0FXQl/hI04IaQC3z2r9gMBnalFMhhyN3IitIoXbKWyh8usmsRUaUZNgls1E3Kr9GXQ
	O1txZ+guAtlBIoZINYuNSgwBRZEJW22eHomaQ=
Received: by 10.213.26.14 with SMTP id b14mr3552208ebc.15.1286960646382;
	Wed, 13 Oct 2010 02:04:06 -0700 (PDT)
Received: from [192.168.0.40] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id q54sm10714527eeh.12.2010.10.13.02.04.04
	(version=SSLv3 cipher=RC4-MD5); Wed, 13 Oct 2010 02:04:05 -0700 (PDT)
Message-ID: <4CB57639.1080908@gmail.com>
Date: Wed, 13 Oct 2010 11:04:57 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 09:04:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to compile log4cxx, but it fails compiling apr-util, saying 
that it is looking at host includes.

I suspect the following from log.do_configure is a problem:

/checking for pg_config... /usr/bin/pg_config
   adding "-I/usr/include/postgresql" to CPPFLAGS
   adding "-L/usr/lib" to LDFLAGS/

But I have no idea how to fix it...

- Tasslehoff

