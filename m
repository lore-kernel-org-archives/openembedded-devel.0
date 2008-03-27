Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Jeulv-0002DG-Nw
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 17:16:12 +0100
Received: from [192.168.1.120] ([::ffff:118.166.66.232])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 27 Mar 2008 16:16:06 +0000
	id 00041168.47EBC847.00001C42
Message-ID: <47EBC835.3040501@xora.org.uk>
Date: Thu, 27 Mar 2008 16:15:49 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270349.59619.zecke@selfish.org>
In-Reply-To: <200803270349.59619.zecke@selfish.org>
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 16:16:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> On Thursday 27 March 2008 01:32:29 Graeme Gregory wrote:
>   
>> Moving a private discussion public I started to add a quick score card for
>> SCM's
>>
>> This is currently how I see feature support.
>>
>> So far we seem to have this list where goodness is 1-5 (5 being good)
>>
>> CPU Load Git 5 Monotone 3
>> Ease of branching Git 5 Monotone 5
>> Ease of Branch Merging Git 4 Monotone 3
>> Ease of Serving Git 1 Monotone 5
>> Ease of Distributed SCM Git 2 Monotone 5
>>
>>
>> Im sure there is more scores we can add to this list. And you might not
>> agree with my scores, but it seems pretty close so far.
>>     
>
> Ease of publishing branches Git 5 Monotone 0:
> 	Reasoning:
> 		With git, I push and transfer the number of bytes that I have changed
> 		to the server. So a small change is a small upload.
>
> 		With mtn (0.37 here) in contrast it wants to upload every revision to the 
> 		server. I'm on a GPRS/UMTS/CDMA line and after ~48MB of upload I got 
> 		disconnected, twice. The revs still reside on my disk only, I'm not able
> 		to share it. The database is locked during this operation, I can not do 
> 		diffs, commits, checkouts during this time.
>
> 		Publishing means uploading what we have created, which is a lot bigger than 
> 		just my small change.
>
>
>   
You experience differs from mine, when I created OM branch I only 
transfered one rev to server.

But I did have to tell it about both branches involved in the sync.

Otherwise the source mtn doesnt know the destination one already
has the revs the branch is based on.

Graeme



