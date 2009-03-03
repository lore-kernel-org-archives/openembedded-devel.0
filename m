Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1LeNeC-00031a-Ha
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 06:58:33 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id AF7C846757
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2009 18:54:31 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id 9E1A246756for 
	<openembedded-devel@lists.openembedded.org>; Tue,  3 Mar 2009 18:54:30 
	+1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KFX000010QVTR00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Tue,03 Mar 2009 18:54:30 +1300 (NZDT)
Received: from [172.25.116.23] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KFX00LWG1QSLF10@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Tue,03 Mar 2009 18:54:29 
	+1300 (NZDT)
Date: Tue, 03 Mar 2009 18:54:23 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <20090303021719.GK26343@smtp.west.cox.net>
To: openembedded-devel@lists.openembedded.org
Message-id: <49ACC60F.9050808@tait.co.nz>
MIME-version: 1.0
References: <49AB58CA.7090406@tait.co.nz> 
	<gohslm$3bl$1@ger.gmane.org><20090303021719.GK26343@smtp.west.cox.net>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
X-imss-version: 2.053
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
Subject: Re: fatal: Not a git repository
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
X-List-Received-Date: Tue, 03 Mar 2009 05:58:33 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Tom Rini wrote:
> On Tue, Mar 03, 2009 at 12:12:38AM +0000, Vitus Jensen wrote:
>   
>> Am Mon, 02 Mar 2009 16:55:54 +1300 schrieb Douglas Royds:
>>     
>>> Anyone else getting this?
>>>
>>>     NOTE: Handling BitBake files: / (6587/6587) [100 %] NOTE: Parsing
>>>     finished. 6302 cached, 0 parsed, 285 skipped, 0 masked. NOTE: Cache
>>>     is clean, not saving.
>>>     NOTE: build 200903021645: started
>>>     fatal: Not a git repository <----------------------
>>>
>>>     OE Build Configuration:
>>>     BB_VERSION        = "1.8.12"
>>>     ...
>>>       
>> Yes, it happens on every build.  I guess bitbake is testing the current 
>> directory via git and would include the current head in the build number.
>>
>>     
>>> The same complaint seems to crop up at various points during a build, as
>>> well.
>>>
>>> Suggestions?
>>>       
>> Just ignore.  Besides called "fatal" it isn't fatal at all.
>>     
>
> Well, to git it's fatal :)  Someone should dig to where the call is and
> redirect stderr somewhere, I suspect..
>   

This silences it, though I'm not sure that it's the right solution:

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 18afc1a..21b08a5 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -807,7 +807,7 @@ def base_get_metadata_svn_revision(d):
 
 def base_get_metadata_git_branch(d):
        import os
-       branch = os.popen('cd %s; git branch | grep "^* " | tr -d "* "' 
% base_get_scmbasepath(d)).read()
+       branch = os.popen('cd %s; git branch 2>&1 | grep "^* " | tr -d 
"* "' % base_get_scmbasepath(d)).read()
 
        if len(branch) != 0:
                return branch






=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



