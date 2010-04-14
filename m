Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O22am-0001SU-OQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 15:25:21 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3EDLqMD003191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 15:21:52 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1O22XP-0006AE-Ml
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 15:21:51 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1271238939-7065-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<87hbne8aiz.fsf@SSpaeth.de>
Date: Wed, 14 Apr 2010 15:21:51 +0200
In-Reply-To: <87hbne8aiz.fsf@SSpaeth.de> (Sebastian Spaeth's message of "Wed, 
	14 Apr 2010 14:48:52 +0200")
Message-ID: <ly39yy2mq8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 14 Apr 2010 13:25:21 -0000
Content-Type: text/plain; charset=us-ascii

"Sebastian Spaeth" <Sebastian@SSpaeth.de> writes:

>> @@ -227,7 +238,9 @@ python packagestage_scenefunc () {
>> -        os.system('rm -f ' + stamp + '.*')
>> +	for fname in glob.glob(stamp + '.*'):
>> +	    _package_unlink(fname)
>> +
>
>> @@ -260,8 +273,8 @@ python packagedstage_stampfixing_eventhandler() {
>> -                        os.system('rm -f ' + dir)
>> -                    os.system('rm -f ' + stamp)
>> +			_package_unlink(dir)
>> +		    _package_unlink(stamp)
>
> Given you have made sure that those changed indentations are actually
> intended (I have not looked at the context of that patch):

File had already a mixed tab/whitespace indentation.  I used the style
which I found at the top of the file (tabulators) and did not noticed
that it changed below.



Enrico


