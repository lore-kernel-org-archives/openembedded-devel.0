Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JbxJU-0007V9-Mi
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 13:22:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2JCMajx006013
	for <openembedded-devel@openembedded.org>; Wed, 19 Mar 2008 12:22:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05712-09 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 12:22:28 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2JCMQ35006001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 19 Mar 2008 12:22:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
Date: Wed, 19 Mar 2008 12:22:26 +0000
Message-Id: <1205929346.4555.34.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2008 12:22:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2008-03-19 at 11:50 +0100, Koen Kooi wrote:
> Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and  
> should die. If we want packaged-staging and rm_work to function we  
> need to fix them. Since we are all lazy we need some incentive:
[...]
> --- classes/insane.bbclass      0712df99743c442ed311e6b4d4be0d28f29d525f
> +++ classes/insane.bbclass      fa6b704f402965c8123dfa90527b5a11a8cd3288
> @@ -178,7 +178,7 @@ def package_qa_make_fatal_error(error_cl
> 
>       TODO: Load a whitelist of known errors
>       """
> - -    return not error_class in [0, 5, 7, 8]
> +    return not error_class in [0, 5, 7]
> 
>   def package_qa_write_error(error_class, name, path, d):
>       """

I'm ok with applying that since we do really need to sort out these
issues.

I did a load of cleanup in this area in poky and found in a lot of cases
this happened since we weren't using oe_libinstall which mangles the .la
files if it notices anything wrong with them. There is at least one fix
in Poky which might help the gstreamer packages from this PoV and I'll
try and merge that.

Cheers,

Richard



