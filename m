Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MY93Q-0002fb-QT
	for openembedded-devel@openembedded.org; Tue, 04 Aug 2009 03:43:05 +0200
Received: (qmail 22676 invoked by uid 509); 4 Aug 2009 09:21:34 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.026342 secs); 04 Aug 2009 01:21:34 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.026342 secs Process 22669)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 4 Aug 2009 09:21:34 +0800
Message-ID: <8802C38E1C714D3C990F04703B317682@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
References: <DAE7325AE217459DAF9E0769B867ED98@sg01.cassis><h562kl$iuf$1@ger.gmane.org><7C16A480101D49679492E3351AC7450E@sg01.cassis><1249309178.3246.32.camel@hammer.suse.cz>
	<1249312182.3246.49.camel@hammer.suse.cz>
Date: Tue, 4 Aug 2009 09:36:04 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Re: libtool/libltdl problem
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
X-List-Received-Date: Tue, 04 Aug 2009 01:43:06 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Thanks guys for the replies.

----- Original Message ----- 
From: "Stanislav Brabec" <utx@penguin.cz>
To: <openembedded-devel@lists.openembedded.org>
Sent: Monday, August 03, 2009 11:09 PM
Subject: Re: [oe] libtool/libltdl problem


> Stanislav Brabec wrote:
> 
>> I hope that all these issues are fixed by:
> 
>> These fixes should make libtool working again.
> 
> Well, yet another problem found:
> 
> libtool-cross and -sdk packages used target paths to grep and sed.
> Target paths should be used only for libtool package and nothing else.
> libtool-cross, libtool-native and libtool-sdk should use values provided
> by system check. Fixed by:
> daf5409a75e97aa5a60b11e9f150e2532676889e
> 
> If you know a better way, how to apply variables just for the target
> build and not for -native, -cross and -sdk builds, feel free to improve
> the recipe.
> 
> I found one possible consequent mis-compilation: imagemagick fixed by PR
> bump: de1cf42779c207621d25afc08ad65f655494d573
> 
> -- 
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


