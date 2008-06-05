Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1K4Bqg-0004aB-Pr
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jun 2008 11:33:51 +0200
Received: by yw-out-1718.google.com with SMTP id 5so293219ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2008 02:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=TZRS1hd6FBOAGshOSsUhhuZXwDNB4IYtDi75xGGDrss=;
	b=wpbBZlPMyldxZ+zHeoIBmcQcROOEZNzd2HYJIb2Y2M5oG2XhAhsHJqqUI+u41pcdxM
	C9r9keRfzUxepsdM2IrDb0/qTy5isqBOC36OxOrvlweTFQ1UDPKZwCDR8SJfJae6BYBi
	QNfuuTNsJ6ERCX5x8SB16gFDYOCJu28M2u0f4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=rzIISyUph5uOaIpJRPJj8kXYKDuUOl2sV2/tBxMBkumzD6HCIpF1lF7tlKmF4Yjfpi
	0QK0FpEqXqYDs9b1VET2kmuHKZJSDjbx5O1EEmrQd9xj3PYAf7cTpZmU+z5Q3D+nx5Tn
	1xuEa01gBMU5Ng1FT2HMmlQ6S45tR1ZNJQ0xA=
Received: by 10.151.114.7 with SMTP id r7mr1409200ybm.191.1212658133308;
	Thu, 05 Jun 2008 02:28:53 -0700 (PDT)
Received: from ?192.168.1.204? ( [68.188.71.196])
	by mx.google.com with ESMTPS id 6sm3255762ywc.8.2008.06.05.02.28.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Jun 2008 02:28:52 -0700 (PDT)
Message-ID: <4847B1D1.4030808@gmail.com>
Date: Thu, 05 Jun 2008 04:28:49 -0500
From: Gordon <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48475542.6040008@xs4all.nl>
In-Reply-To: <48475542.6040008@xs4all.nl>
Cc: Discussion and review of changes to the stable branch and its policy
	<openembedded-stablebranch@openembedded.org>
Subject: Re: QA errors after bitbake navit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 05 Jun 2008 09:34:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2008 09:53 PM, Udo van den Heuvel wrote:
> Hello,
> 
> I was building navit from cvs for angstrom 2007.12 (stable) and
> encountered a number of QA errors whish I was told were fixable.
> 
> The errors look like:
> .la contains reference to the workdir, staging,
> /staging/arm-angstrom-linux-gnueabi/lib/libatk-1.0.la
> evil hides inside the .la, staging,
> /staging/arm-angstrom-linux-gnueabi/lib/libsupc++.la
> 
> The full error is at http://bugs.openembedded.net/show_bug.cgi?id=4348.
> 
> What needs to be done to fix? Can anybody help or look into this?
> 

Udo

These QA errors are known problem for the stable branch. RP has fixed 
these problems in the dev branch. However, it's not trivial to backport 
the fix to stable (use sysroot, etc.). So I am afraid as long as it's 
just an annoyance, we won't fix it for the stable branch.

You can also use QA_LOG = "0" to mask the output of the error messages.

Regards
Gordon


