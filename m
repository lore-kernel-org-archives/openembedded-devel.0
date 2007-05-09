Received: from [64.233.184.239] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1Hls5e-0005z7-D6
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 21:44:46 +0200
Received: by wr-out-0506.google.com with SMTP id 55so341349wri
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2007 12:44:10 -0700 (PDT)
Received: by 10.114.175.16 with SMTP id x16mr295381wae.1178739849198;
	Wed, 09 May 2007 12:44:09 -0700 (PDT)
Received: by 10.114.147.18 with HTTP; Wed, 9 May 2007 12:44:09 -0700 (PDT)
Message-ID: <bdb0025f0705091244u19ce0129h957f9c34154454f0@mail.gmail.com>
Date: Wed, 9 May 2007 16:44:09 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0705021338x7ca36c0oc937a6b1b03f6db5@mail.gmail.com>
MIME-Version: 1.0
References: <bdb0025f0705021104x23d2c407rb4da0e48e24eb911@mail.gmail.com>
	<200705022051.03720.openembedded@hrw.one.pl>
	<bdb0025f0705021252w7e32b305ybf9c914c1cb1edc0@mail.gmail.com>
	<432beae0705021338x7ca36c0oc937a6b1b03f6db5@mail.gmail.com>
Subject: Re: generating debian source packages (dsc)
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
X-List-Received-Date: Wed, 09 May 2007 19:44:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm trying to use inherit sourcepkg without success.
Does anybody has any suggestion about the following error?

NOTE: package shasum-native-1.0: started
NOTE: package shasum-native-1.0-r1: task do_create_orig_tgz: started
NOTE: <type 'exceptions.IndexError'>:list index out of range while evaluating:

        mkdir -p /indt/mamona/openembedded/tmp/deploy/source
        cd /indt/mamona/openembedded/tmp/work/shasum-native-1.0-r1
        for i in .pc autom4te.cache; do
                echo $i >> temp/exclude-from-file
        done

        src_tree=${@get_src_tree(d)}

        echo $src_tree
        oenote "Creating .orig.tar.gz in
/indt/mamona/openembedded/tmp/deploy/source/shasum-native-1.0.orig.tar.gz"
        tar cvzf
/indt/mamona/openembedded/tmp/deploy/source/shasum-native-1.0.orig.tar.gz
--exclude-from temp/exclude-from-file $src_tree
        cp -pPR $src_tree $src_tree.orig

NOTE: <type 'exceptions.IndexError'>:list index out of range while evaluating:

        cd /indt/mamona/openembedded/tmp/work/shasum-native-1.0-r1
        for i in .pc autom4te.cache; do
                echo $i >> temp/exclude-from-file
        done


        src_tree=${@get_src_tree(d)}

        for i in `find . -maxdepth 1 -type f`; do
                mkdir -p $src_tree/mamona/files
                cp $i $src_tree/mamona/files
        done

        oenote "Creating .diff.gz in
/indt/mamona/openembedded/tmp/deploy/source/shasum-native-1.0-r1.diff.gz"
        LC_ALL=C TZ=UTC0 diff --exclude-from=temp/exclude-from-file
-Naur $src_tree.orig $src_tree | gzip -c >
/indt/mamona/openembedded/tmp/deploy/source/shasum-native-1.0-r1.diff.gz
        rm -rf $src_tree.orig

NOTE: <type 'exceptions.IndexError'>:list index out of range while evaluating:

        src_tree=${@get_src_tree(d)}
        dest=/indt/mamona/openembedded/tmp/work/shasum-native-1.0-r1/$src_tree/mamona
        mkdir -p $dest

        cp /indt/mamona/openembedded/org.openembedded.dev/packages/shasum/shasum-native.bb
$dest

ERROR: function do_create_orig_tgz failed
ERROR: log data follows
(/indt/mamona/openembedded/tmp/work/shasum-native-1.0-r1/temp/log.do_create_orig_tgz.6911)
| /indt/mamona/openembedded/tmp/work/shasum-native-1.0-r1/temp/run.do_create_orig_tgz.6911:
line 510: sourcepkg_do_create_orig_tgz: command not found
NOTE: Task failed:
/indt/mamona/openembedded/tmp/work/shasum-native-1.0-r1/temp/log.do_create_orig_tgz.6911
NOTE: package shasum-native-1.0-r1: task do_create_orig_tgz: failed
ERROR: TaskFailed event exception, aborting
NOTE: package shasum-native-1.0: failed


On 5/2/07, Justin Patrin <papercrane@gmail.com> wrote:
> On 5/2/07, Rodrigo Vivi <rodrigo.vivi@gmail.com> wrote:
> > > classes/sourcepkg.bbclass is something which you want to extend
> >
> > I've thought about it but I'm not sure that it is a good idea because
> > just few projects (or just mine) needs the dsc file .......... unless
> > that I code another sourcedsc.bbclass that inherit the
> > sourcedpkg.bbclass... o you think that it will work???  I'll think
> > about it...
> >
>
> Yes, this is what Marcin meant. Create your own sourcedsc.bbclass
> which inherits sourcepkg.bbclass. This is how, for example,
> efl.bbclass and e.bbclass work.
>
> > Another doubt that I forgot to mention on last email is about changelog:
> > I'm generating a almost empty changelog file. Is there any official
> > and/or more appropriated way to do that?
> >
> > Thanks,
> > Vivi.
> >
> > >
> > > --
> > > JID: hrw-jabber.org
> > > OpenEmbedded developer/consultant
> > >
> > >       I'm trying to decide if I should kill you or simply feign death
> > >       until you feel awkward and leave.
> > >
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
> --
> Justin Patrin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


