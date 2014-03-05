Return-Path: <mike.looijmans@topic.nl>
Received: from smtp06.online.nl (smtp06.online.nl [194.134.42.51])
	by mail.openembedded.org (Postfix) with ESMTP id 876B16D189
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 19:49:37 +0000 (UTC)
Received: from smtp06.online.nl (localhost [127.0.0.1])
	by smtp06.online.nl (Postfix) with ESMTP id 5874996191;
	Wed,  5 Mar 2014 20:49:37 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp06.online.nl (Postfix) with ESMTP;
	Wed,  5 Mar 2014 20:49:37 +0100 (CET)
Message-ID: <53177FD1.2010407@topic.nl>
Date: Wed, 05 Mar 2014 20:49:37 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1393696487-30736-1-git-send-email-mike.looijmans@topic.nl>
	<20140305180816.GA26981@jama>
In-Reply-To: <20140305180816.GA26981@jama>
X-Online-Scanned: by Cloudmark authority (on smtp06.online.nl)
Cc: openembedded-devel@lists.openembedded.org,
	Mike Looijmans <milo-software@users.sourceforge.net>
Subject: Re: [PATCH] musicbrainz: Build with B=S
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
X-List-Received-Date: Wed, 05 Mar 2014 19:49:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5-3-2014 19:08, Martin Jansa wrote:
> On Sat, Mar 01, 2014 at 06:54:47PM +0100, mike.looijmans@topic.nl wrote:
>> From: Mike Looijmans <milo-software@users.sourceforge.net>
>>
>> This recipe doesn't work when B!=S, so force B=$S to fix the failure.
>>
>> Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
> What's the relation of this change to
> http://patchwork.openembedded.org/patch/67597/
> ?

I suspect they both accomplish the same: Make the project compile again. 
Mine is the simplistic approach I guess - I did the least I could 
possible get away with... "Theirs" looks more like they actually 
understand what's going on

Mike.


>> ---
>>   .../musicbrainz/libmusicbrainz_git.bb              |    3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> index f6a8f53..4cc04b8 100644
>> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> @@ -37,3 +37,6 @@ do_configure_prepend() {
>>   
>>   EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
>>                    -DIMPORT_EXECUTABLES=build-native/ImportExecutables.cmake"
>> +
>> +# out-of-tree building doesn't appear to work for this package.
>> +B = "${S}"
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Mike Looijmans


