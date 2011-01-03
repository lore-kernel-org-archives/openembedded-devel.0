Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZr3z-00065H-BG
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:31:31 +0100
Received: by fxm17 with SMTP id 17so12752897fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mueZrTgPOV5VvH0VwbbQmFCnSVXCzf30QwNAIJLwNKE=;
	b=tB3elq1thAW2RZLdtcUnFGdYYxF4AdKF75W4bq7slDvbyNkT5P5o63AhgMNsCGTsO2
	PtC5aYarjPLTESbjrAdhJ4wW1+JsCZ2pNx23pd2NE4F3lPId2G/aPwVAzHWq/chw+Q5N
	cP0cqsfXsNdcMHxViZa4mYT5eYkyL8ClJDtmg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Tnq0arr175MWw5eJa42yJxcFvrU7I4UfXuHgnnJTHxWRssH8BZx9a6GIRWQuex2SQT
	vXmEmwEpjZOiK0eajD8MFBf5I2wdxJ/E5c52n0jrzMgqi/uO+Jfn2EtztbX4ju/C93gM
	K+QZ+FHIA/5G0asFtxJOjS3+gba7pNvHRBgsw=
Received: by 10.223.53.68 with SMTP id l4mr4139170fag.44.1294086669563;
	Mon, 03 Jan 2011 12:31:09 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n26sm4890280fam.13.2011.01.03.12.31.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:31:08 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZr3b-0000yK-2y; Mon, 03 Jan 2011 21:31:07 +0100
Date: Mon, 3 Jan 2011 21:31:07 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110103203107.GC25803@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<iftaqd$6m4$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <iftaqd$6m4$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 01/12] gstd: fix type in RRECOMENDS
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
X-List-Received-Date: Mon, 03 Jan 2011 20:31:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 03, 2011 at 09:16:13PM +0100, Koen Kooi wrote:
>On 03-01-11 21:01, Bernhard Reutner-Fischer wrote:
>> /RRECOMENDS/s/COM/COMM/
>> 
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> ---
>>  recipes/gstd/gstd_git.bb |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>> 
>> diff --git a/recipes/gstd/gstd_git.bb b/recipes/gstd/gstd_git.bb
>> index 5e73662..4617b85 100644
>> --- a/recipes/gstd/gstd_git.bb
>> +++ b/recipes/gstd/gstd_git.bb
>> @@ -25,7 +25,7 @@ do_configure() {
>>  }
>>  
>>  RDEPENDS_${PN} = "dbus dbus-glib gstreamer gst-plugins-base"
>> -RRECOMENDS_${PN} = "gstreamer-ti"
>> +RRECOMMENDS_${PN} = "gstreamer-ti"
>
>Such changes require a PR bump

so i'll leave that to whoever actually uses it. Retracted.


