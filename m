Received: from [75.127.235.98] (helo=breezy.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <tom@openhardware.net>) id 1K558H-00052d-Ri
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 22:35:26 +0200
Received: (qmail 25773 invoked from network); 7 Jun 2008 20:30:23 -0000
Received: from unknown (HELO slushy.openhardware.net) (172.29.4.2)
	by breezy.kfctristate.com with SMTP; 7 Jun 2008 20:30:23 -0000
Message-ID: <484AEFDE.4040500@openhardware.net>
Date: Sat, 07 Jun 2008 16:30:22 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 2.0.0.12 (X11/20080306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200806060643.37332.p_blacquiere@yahoo.co.uk>
	<200806060024.23268.mickey@vanille-media.de>
In-Reply-To: <200806060024.23268.mickey@vanille-media.de>
Subject: Re: Exception.ValueError during build
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
X-List-Received-Date: Sat, 07 Jun 2008 20:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> On Thursday 05 June 2008 20:43:37 Paul Blacquiere wrote:
>   
>> Hi,
>>
>> While trying to build (independent of what machine or distro) I get the
>> following error almost immediately.
>>
>> ********************************************************************
>> $>  bitbake helloworld-image
>>
>> NOTE: Out of date cache found, rebuilding...
>> NOTE: Handling BitBake files: | (0001/0001) [100 %]
>> NOTE: Parsing finished. 0 cached, 1 parsed, 0 skipped, 0 masked.
>>     
>
> This looks like either BitBake does not find your configuration directory 
> (double check BBPATH) or you are missing the path to your BitBake files 
> (double check BBFILES in your local.conf).
>
> [...]
>
>   
something broken, I see it too.  This "corrects the problem":

--- org.openembedded.dev/classes/base.bbclass~  2008-06-07 
11:11:04.000000000 -0400
+++ org.openembedded.dev/classes/base.bbclass   2008-06-07 
16:26:24.000000000 -0400
@@ -718,7 +718,8 @@
        return monotone_branch

 def base_get_metadata_monotone_revision(d):
-       monotone_revision = "<unknown>"
+       monotone_revision = "1"
+       return monotone_revision
        try:
                monotone_revision = file( "%s/_MTN/revision" % 
base_get_scmbasepath(d) ).read().strip()
                if monotone_revision.startswith( "format_version" ):

>> NOTE: build 200806060630: started
>> NOTE: <type 'exceptions.ValueError'>:substring not found while evaluating:
>> ${@base_get_metadata_monotone_revision(d)}
>> Traceback (most recent call last):
>>   File "/stuff/bitbake/bin/bitbake", line 134, in <module>
>>     main()
>>   File "/stuff/bitbake/bin/bitbake", line 131, in main
>>     cooker.cook()
>>   File "/stuff/bitbake/lib/bb/cooker.py", line 636, in cook
>>     return self.buildTargets(pkgs_to_build)
>>   File "/stuff/bitbake/lib/bb/cooker.py", line 527, in buildTargets
>>     bb.event.fire(bb.event.BuildStarted(buildname, targets,
>> self.configuration.event_data))
>>   File "/stuff/bitbake/lib/bb/event.py", line 67, in fire
>>     if tmpHandler(event) == Handled:
>>   File "tmpHandler(e)", line 31, in tmpHandler
>>   File "/stuff/bitbake/lib/bb/data.py", line 97, in getVar
>>     return d.getVar(var,exp)
>>   File "/stuff/bitbake/lib/bb/data_smart.py", line 170, in getVar
>>     return self.expand(value,var)
>>   File "/stuff/bitbake/lib/bb/data_smart.py", line 85, in expand
>>     s = __expand_python_regexp__.sub(python_sub, s)
>>   File "/stuff/bitbake/lib/bb/data_smart.py", line 71, in python_sub
>>     s = eval(code)
>>   File "<string>", line 1, in <module>
>>   File "<bb>", line 4, in base_get_metadata_monotone_revision
>>   File "<bb>", line 4, in base_get_scmbasepath
>> ValueError: substring not found
>>     
>
> Fwiw, we should catch this error and put something more sane out.
>
> :M:
>   


-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




