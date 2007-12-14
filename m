Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <filippo@zirak.it>) id 1J37uf-0005tq-24
	for openembedded-devel@openembedded.org; Fri, 14 Dec 2007 11:37:01 +0100
Received: (qmail 12605 invoked by uid 64017); 14 Dec 2007 10:29:39 -0000
Received: from 192.168.100.1 (filippo@zirak.it@192.168.100.1) by www-zirak-new
	(envelope-from <filippo@zirak.it>,
	uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(192.168.100.1):. 
	Processed in 0.924524 secs); 14 Dec 2007 10:29:39 -0000
Received: from unknown (HELO ?192.168.1.33?) (filippo@zirak.it@192.168.100.1)
	by www-zirak-new.zirak.it with SMTP; 14 Dec 2007 10:29:38 -0000
Message-ID: <47625BB8.1010509@zirak.it>
Date: Fri, 14 Dec 2007 11:32:24 +0100
From: Filippo Basso <filippo@zirak.it>
User-Agent: IceDove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47606910.9000505@zirak.it>	<74d0deb30712130004v11453c5x109386d74997d6b0@mail.gmail.com>	<1E7281BD-99E7-42CA-993D-3B95BE7C4EA9@selfish.org>
	<4761B18E.1080805@zirak.it>
In-Reply-To: <4761B18E.1080805@zirak.it>
X-Enigmail-Version: 0.94.2.0
Subject: Re: bash-completion for bitbake
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
X-List-Received-Date: Fri, 14 Dec 2007 10:37:01 -0000
Content-Type: multipart/mixed; boundary="------------000408070908010706080904"

--------------000408070908010706080904
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

last version of the script,
    works also with packages with no "_" in the recipe filename, bug
found/fixed this morning.
phy



#
# "bitbake autocompletion description"
#
# LICENSE:	GNU GPLv2 or any later version
# CREATED:	Filippo Basso <filippo@zirak.it> (12-DEC-2007)
# MODIFIED:
#
# Use: 
# - simply put it into your /etc/bash_completion.d/ directory...
# For help enhancing this script, see also:
# - http://www.debian-administration.org/articles/317
# - http://www.gnu.org/software/bash/manual/bashref.html#SEC112
#


_bitbake() 
{
	local cur conns prev options options1 i j A recipefile
	COMPREPLY=()

	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	options="--help --version --buildfile= --continue --force --interactive --cmd= --read= --verbose --debug --dry-run --parse-only --disable-psyco --show-versions --environment --graphviz --ignore-deps= --log-domains= --profile"
	options1="-h -b -k -f -i -c -r -v -D -n -p -d -s -e -g -I -l -P"
	commands="fetchall listtasks rebuild compile build populate_staging mrproper fetch configure clean package unpack install package_write distribute_sources showdata qa_configure qa_staging patch devshell package_write_deb package_deb_install buildall"

	# ------- Sanity checks -------
	if [[ ${BBPATH} == "" ]]
	then
		echo
		echo "variable \$BBPATH not set, please set it before launching bitbake... thanx"
		return 1
	fi

	# ------- Options completion -------
	if [[ ${prev} == "-c" ]]
	then
		COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
		return 0
	fi

	if [[ ${cur} == -* ]]
	then
    		if [[ ${cur} == --* ]]
		then
			COMPREPLY=( $(compgen -W "${options}" -- ${cur}) )
			return 0
		else
       			COMPREPLY=( $(compgen -W "${options1}" -- ${cur}) )
        		return 0
		fi
	fi

	# ------- Recipe list autocompletion -------
	for i in `echo $BBPATH | sed s/:/\ /g` ;
	do
		for j in `echo $i/packages/*/${cur}*.bb` ;
	        do
			if [[ -f $j ]]
			then
	                       	recipefile=`basename $j`
				recipefile=${recipefile%%_*.bb}
				recipefile=${recipefile%%.bb}
	                       	conns="$conns ${recipefile}"
			fi
	        done
	done
    	COMPREPLY=( $(compgen -W "${conns}" -- ${cur}) )
	return 0

}
complete -F _bitbake bitbake


--------------000408070908010706080904--
