Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PqU5D-0006oR-Ok
	for openembedded-devel@openembedded.org; Fri, 18 Feb 2011 18:25:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1IHJ8GD013270;
	Fri, 18 Feb 2011 17:19:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13109-03; Fri, 18 Feb 2011 17:19:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1IHJ2Ph013264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 18 Feb 2011 17:19:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Fri, 18 Feb 2011 17:18:55 +0000
Message-ID: <1298049536.11289.3126.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake 1.12.0 released!
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
X-List-Received-Date: Fri, 18 Feb 2011 17:25:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Bitbake 1.12.0 has been released.

http://prdownload.berlios.de/bitbake/bitbake-1.12.0.tar.gz

This release has many cleanups and improvements to the bitbake core. The
biggest and most user visible change is the parallel parsing work which
is the driving reason for the release.

A git log of the differences between 1.10 and 1.12 follows.


Andreas Oberritter (3):
      fetchers: Add parameter scmdata=keep to include .git/ and others in generated tarballs.
      manual: document scmdata=keep for CVS, SVN and Git
      .gitignore: add *.pyo

Bernhard Reutner-Fischer (38):
      fetch: documentation typo fix
      cache: fix typo in error message of cacheValidUpdate()
      fetch: commentary typo fix in fetcher_init()
      cache: use os.path ops instead of stat
      cache: use max() to determine newest_mtime
      cache: use a set() for __depends
      persist_data: cache connection and use cursor
      cache: do not chdir unnecessarily
      cooker: use time.strftime() instead of spawing sh with date
      parser: fix harmless typo in variable name
      *: use print() as a function
      *: cosmetic whitespace removal
      utils: Fix number of arguments to bb.msg functions
      *: Fix typo in documentation
      bb.cache: only log if the respective action was taken
      BBHandler: simplify supports()
      BBHandler: use os.path in inherit()
      fetch: rename suppports_srcrev to supports_srcrev
      fetch: add common helper _strip_leading_slashes()
      fetch: use os.path.join
      fetch: be more pythonic
      svn fetcher: warn people to switch to SRCREV
      build: use utils.remove instead of os.system
      bzr: use utils.remove instead of os.system
      utils: don't overwrite builtin dir() function
      bitbake.conf: use bb.utils.which
      utils: fix typo in error message
      runqueue: use fewer newlines in error path
      runqueue: fix typo in documentation of calculate_task_weights
      parse: Use constants from stat instead of magic numbers
      data: fewer newlines for (un)export
      BBHandler: use basename directly in handler()
      cache: defer marking fn as clean
      event: fix unicode handler registration
      ConfHandler: commentary typo fixes
      build: remove duplicate import of utils
      *: use utils.remove() some more
      codeparser: fix spacing in diagnostic messages

Bob Foerster (8):
      Prefer xrange over range for small performance gain.
      cooker: don't fire unnecessary parse progress events
      Run the server and UI in separate processes
      Show the user progress when loading the cache
      server: fix interrupt handling for process
      Resurrect alternative UIs
      Timeout UI runCommand calls if server doesn't respond (or dies)
      depexp: add sorting of all package lists

C Michael Sundius (2):
      Allow %20 in a file name in the SRC_URI
      Allow %20 in a file name in the SRC_URI

Chris Larson (310):
      Add bin/bitbakec to .gitignore
      Drop doctest, as we aren't utilizing it
      Initialize pkgs_to_build in the BBConfiguration constructor
      Move update_data into the DataSmart class as a finalize() method
      Rename the finalise method for consistency
      bb.event: NotHandled and Handled are on the way out
      Ensure we always utilize the correct messaging domains
      Fix the task event handling in the ncurses UI
      Use __import__ for the ui rather than exec
      Immediately display messages if no UI handlers are installed yet
      Display python warnings via bb.msg
      Fix an error in the ncurses UI
      Implement bb.msg.domain as a named tuple, drop the Enum class
      Make the default domain a proper domain, not a string
      Bump minimum python version check to 2.6.
      Fix invalid logging domain warning
      Add a function to get the debug level, without poking into debug_levels manually
      Stop using functions via 'bb' that were moved from there to other modules
      Don't run metadata event handlers for bb.msg events
      Formatting cleanups
      Import fixups
      Drop some unused vars
      Drop some unused classes
      Drop some unused functions
      Drop __all__ usage
      Add some missing docstrings
      Exception handling fixups
      Deprecate the usage of certain objects via certain modules
      Apply the 2to3 print function transform
      Add a missing import of print_function
      Switch some references to moved functions
      Ignore deprecation warnings for now
      Drop unused bb.data.expandData function
      Add __contains__ to COWDictMeta
      Apply some 2to3 transforms that don't cause issues in 2.6
      Kill unnecessary usages of the types module
      Move the unset BBPATH sanity check after the bblayers processing
      Add a hack to avoid the req that all vars using LAYERDIR be immediately expanded
      Search up the directory tree for bblayers.conf
      Move the python version check before the module imports, in case the modules utilize the newer python features
      Bump version to 1.11.0
      Drop an unnecessary second python version check and use the less ugly sys.version_info
      Move the python version check into the python package
      Make DataSmart inherit the MutableMapping ABC
      Don't try to expand non-string values
      Fix the debug level check in print_exception
      emit_env: clean up, iterate once
      Allow emission of non-string objects in emit_var, instead running str() on it first
      For ${@}, run str() on the result
      Enhance the expansion exception message
      Move a var definition in cooker.parse_next
      Fix major bug that slipped in when moving update_data
      Simplify _findVar a bit
      In expand, drop the unnecessary second regular expression match
      Don't emit vars starting with __, as those are internal
      Revert "In expand, drop the unnecessary second regular expression match"
      Make the file not found error actually useable.
      Adjust the exception handling based on Cliff Brake's patch
      Don't tell the user we're sending SIGINT to the remaining 0 tasks
      Make knotty ignore the NoProvider event
      Reorganize the main exception handling so an attribute exception raised in the ui isn't misinterpreted
      Move the output of no provider and multiple provider messages into the UI
      Fix the silent exit when the specified task doesn't exist
      Update the TODO
      Show a traceback when a task fails due to an exception
      Drop the non-debug traceback suppressor, at this point I think it does more harm than good
      Start ditching fatal() calls in favor of raising appropriate exceptions
      Add fatal bits and LAYERDIR bits to TODO
      Use PendingDeprecationWarning for functions moved from bb to bb.utils
      Use bb.utils.mkdirhier in bb.cache to shut up the pending deprecation warning
      knotty: stop freaking out and dying when bb.build has removed the empty logfile
      Add exception bits to TODO
      Kill the unnecessary setVarFlag debugging message
      knotty: use the future division to prep for 3.x
      Drop unnecessarly duplicated messages wrt FuncFailed
      Handle SystemExit and KeyboardInterrupt sanely when executing a command
      cooker: Kill __getitem__ usage on exception objects (python 3 prep)
      Resurrect the excepthook, this time just sending the info with bb.fatal
      Switch a fatal usage to SystemExit ("T" not set)
      Switch from our own 'dummywrite' class to StringIO
      Limit the traceback length in the default exception handler
      Move serverConnection.terminate() back into the finally
      Add missing 'return False' to the SystemExit handler in runAsyncCommand
      Fix syntax error in shell.py
      Until the interactive mode is fixed, kill it from the valid options, to avoid confusion
      Drop a couple usages of readlines
      Apply some 2to3 refactorings
      3.0 prep
      Add a warning if a BBFILE_PATTERN doesn't match any bb files
      Add a couple long term, high impact TODO items
      Let the runqueue find the user selected scheduler dynamically
      Add pysh, ply, and codegen to lib/ to prepare for future work
      When shutting down, send SIGTERM, not SIGINT
      Make realfile optional for better_exec, using the existing fn in the code object
      Drop the 'ui failed to start' message, as the ui_init does more in knotty
      Fix IndexError encountered when a 'depends' flag references a nonexistant task
      Add the ability to use runqueue schedulers from the metadata
      Let the RunQueueScheduler control the number of active tasks
      Split out 'find next buildable task' into a separate generator function
      Merge branch 'data'
      Merge branch 'sched'
      Ignore python warnings that come from places we don't care about
      Fix IndexError encountered when a 'depends' flag references a nonexistant task
      Use the python logging module under the hood for bb.msg
      Use logging in the knotty ui, and pass the log record across directly
      Switch the debug_level dictionary to a defaultdict
      Switch bitbake internals to use logging directly rather than bb.msg
      Add pending deprecation warnings to the bb.msg functions
      Drop 'fn' arguments to bb.msg functions
      Merge branch 'logging'
      Fix providerlog NameError
      Apply fix for issue where the loggers were constructed with the wrong class
      Don't show uncaught exception message for KeyboardInterrupt
      Work around issue with pickling of traceback objects
      Turn Event into a new style class
      Simplify build exception handling
      Fix exit code display for task failure
      Don't show tracebacks for SystemExit or KeyboardInterrupt
      Move display of FuncFailed exception info into the runqueue
      Fix bitbake -k issue introduced by build exception cleanup
      Only reference logfiles that exist
      Restore FuncFailed argument compatibility
      Fix FuncFailed construction
      Reduce bb.cache memory usage a bit
      bb.cache: fix bug from last commit with loading from cache
      Fix another little bug with undefined var from cache
      Queue up events before the UI is spawned
      Fix syntax issue and don't include 'd' in ui_queue
      Fix __getitem__ for DataSmart
      Access metadata vars as locals in python snippets
      Add 1.10.1 entry to ChangeLog
      Resurrect display of failed files
      Make 'cache is clean' message debug
      Fix GraphViz .dot output for rdepends and rrecs
      Fix GraphViz .dot output for rdepends and rrecs
      Per Luke Leighton, drop setuptools/ez_setup usage
      Add missing codegen.py to the distutils install
      Don't ship our own copy of PLY, require it
      Move the pysh package into the bb package
      bb.pysh: fix writing pyshtables all over the place
      bb.pysh: add Case support to format_commands
      persist_data: handle locked db for SELECT
      Pre-explode rundeps/runrecs in CacheData
      cache: make use of defaultdict
      cache: use set for clean, checked
      cache: pyflakes/pep8/pylint cleanup
      cache: use new style classes
      cache: Add debug msg for a nonexistant dep file
      Revert "persist_data: cache connection and use cursor"
      cache: make loadDataFull a classmethod
      runqueue: speed up bitbake -n
      cooker: fix UnboundLocalError
      Revert "svn fetcher: warn people to switch to SRCREV"
      cache: create and use a RecipeInfo class
      cache: don't write out the cache unnecessarily
      Implement parallel parsing support
      Experimental usage of the 'progressbar' module
      Split up the ParseProgress event
      Simplify cache syncing
      cache: sync the cache file to disk in the background
      cache: don't add info to cache if cache is disabled
      cooker: stop loading the cache for -b
      cooker: save progress chunk value (total/100)
      cooker: show progress bar before initializing the cache
      cooker: don't add info for skipped recipes
      cooker: get number of threads in constructor
      cooker: ensure that the cache sync completes
      knotty: drop the ETA from the progressbar for now
      cache: fix rrecs_pkg
      cache: ensure 'pn' is included in the pkgvars
      cache: bump cachever per master
      Use __file__, not sys.argv[0]
      vercmp: don't choke on empty first version components
      cooker: pass back child exceptions to the server
      cache: change to more incremental format
      Merge branch 'feature/parallel-parsing'
      cooker: no cached in progressbar and add ETA
      cooker: don't choke on <100 recipes to parse
      Don't show a traceback for a python version error
      Error more pleasantly when trying to use python2.4
      Fix the <100 recipe progress fix
      Merged the following poky fetcher fixes:
      knotty: shift non-interactive progress into a class
      knotty: use enumerate for task waiting
      cooker: use a pool, abort on first parse error
      cooker: merge cookerState and cookerAction
      cooker: add shutdown/stop methods
      taskdata: use 'any' in re_match_strings
      cooker: use re match, not search in re_match_strings
      Rename the ui 'init' method to 'main'
      process: add subprocess-based bits
      build: use bb.process instead of os.system
      build: use a contextmanager for locks
      utils: fix calls to close() in the lock/unlock functions
      build: fix remnant access of logfile in exec_func_python
      Revert "bitbake/git.py: Make sure different branches can have different revisions without triggering build count increases"
      build: send logging messages to the log file for python functions
      build: kill stdout in python functions
      Kill the uncaught exception handler
      bb.event: fix MsgBase ref in fire_class_handlers
      utils: fix 'lock' variable reference
      event: use cPickle for events
      build: don't create ${B} when the 'dirs' flag is unset
      Rework the persist_data API
      Rename command events, adjust compareRevisions
      Silence python 2.7 nested context manager warning
      Move the runq task start/failed messages to the UI
      build: set PWD in the subprocess preexec hook
      Ensure that the invalid UI error goes to stderr
      Fix PWD issue with new exec_func_shell
      build: fix -D with shell functions
      build: ensure LogTee has a valid name property
      runqueue: fix a get_task_id call
      runqueue: fix check_stamp_task call in chck_stamp_fn
      build: fix copy/paste thinko regarding LC_ALL
      build: write logfiles per task, not per function
      process: handle OSErrors other than file not found
      build: fix FuncFailed for the no logfile case
      build: fix log file display
      runqueue: resurrect the fix in 90c2b6c
      cooker: don't swallow recipe parse errors
      knotty: exit with 1 if we see a critical log message
      runqueue: fix remnant rq/rqdata reference from poky sync
      Revert "build: kill stdout in python functions"
      cooker: fix remnant rq/rqdata issue from poky sync
      server: kill stdin/stdout/stderr
      server: ensure the cooker is stopped when shutting down
      Forcibly shut down the server if the UI is terminated
      utils: drop unnecessary debug msgs from mkdirhier
      cooker: ensure parseCommandLine can get BBPKGS
      Ensure LogHandler is set up for the server construction
      bin/bitbake: [HACK] Empty ui event queue on shutdown
      build: stop injecting os/bb into __builtins__
      build: fix file mode for /dev/null
      Fix logging level names for post-server-ui-split
      Revert "build: stop injecting os/bb into __builtins__"
      Update persist_data usage to the new API
      parse: use bb.utils.which
      Move LAYERDIR expansion hack into DataSmart
      runqueue: kill pre-server-ui-split remnant
      logger usage cleanup
      server: drop none and xmlrpc
      server: fix NULL file mode
      Revert "server: kill stdin/stdout/stderr"
      shell: remove
      Use os.devnull, not /dev/null
      data_smart: handle None values in expandVarrefs
      pysh: add missing os.path import
      utils: show the actual exception in better_exec
      build: pass the correct filename to better_{compile,exec}
      Merge remote branch 'foerster/depexp-sorting'
      persist_data: resurrect the lock wait for selects
      Prepare for 1.10.2
      runqueue: simplify next buildable task
      data_smart: don't include functions in name lookups
      persist_data: unbork the resurrect of select lock wait
      build: only warn about unset functions, not empty ones
      build: allow creation of FuncFailed with no function name
      build: work around do_clean issue by creating T in exec_func
      build: fix empty function execution
      fetch: resurrect branch inclusion in git revision key
      bb.debug: handle caller not passing a debug level
      fetch: fix git rev key compat for sortable
      utils: kill unnecessary duplicated chmod
      fetch: handle no sortable_buildindex for git
      process: fix handling of the input argument
      runqueue: resurrect use of file objects for pipein/pipeout
      runqueue: start implementing quieterrors
      Include exported variables in task process env
      Fix exit code display for task failure
      Don't show tracebacks for SystemExit or KeyboardInterrupt
      vercmp: don't choke on empty first version components
      build: kill unneeded environment setup bits
      build: use logger.isEnabledFor, not getEffectiveLevel
      event: use BBLogFormatter in print_ui_queue
      process: simplify the log option for run
      parse.ast: avoid code duplication for inherit
      parse.ast: drop __word__ regular expression
      parse: pass filename, lineno into the ast
      cache: don't expand variables for skipped recipes
      Merge branch 'poky-sync'
      Inject taskpid into log records via our log handler
      bitbake: handle IOError from event_queue.get
      vim: add an ftplugin for indentation settings
      vim: handle highlighting exports without assignment
      vim: properly highlight python inside of ${@}
      msg: no need to hardcode the logging levels
      cooker: also respond to SystemExit for execute_runqueue
      cache: fix docstring usage
      Add a few items to .gitignore
      Add initial bitbake-layers script
      bitbake-layers: fix bug with env vars leaking in
      Merge branch '1.10'
      build: improve set -x handling
      persist_data: loop on database lock for table creation
      Shift traceback pre-formatting into LogHandler
      persist_data: kill unreachable break line
      event: limit the number of traceback entries to 5
      event: fix exception format
      persist_data: use better items/values methods for SQLTable
      persist_data: drop SQLData indirection
      persist_data: handle lock in sqlite and use the shared cache
      Enable some DeprecationWarnings
      server: add profiling support to ProcessServer
      server: clean up call of write_profile_stats
      runqueue: pass a copy of the RunQueueStats to events
      runqueue: simplify RunQueueStats.copy
      siggen: add bb.data, bb.parse imports
      cooker: don't choke if we have nothing to parse
      uihelper: import bb.build, kill commented lines

Cliff Brake (1):
      remove return in finally statement

Eric BENARD (2):
      bitbake: lib/bb/fetch/hg: fix fetching from a mercurial repository
      bitbake: lib/bb/fetch/hg: fix fetching from a mercurial repository

Holger Hans Peter Freyther (1):
      misc: Update the email address to a working one.

Javier Martin (2):
      Fix comparison with SRCREVINACTION constant
      Export KRB5CCNAME variable

Jeff Dike (3):
      Move the logger initialization from cooker to utils
      create cooker object after cleaning the environment
      create cooker object after cleaning the environment

Joshua Lock (13):
      allow fakeroot functionality to be provided by an alternative program
      fetch: if mirror fetching fails, ensure exception is raised
      fetch: if mirror fetching fails, ensure exception is raised
      bitbake/cooker: fix idle command processing in servers
      bitbake/crumbs: Fix crumbs UI for bitbake event class name changes
      bitbake/crumbs: do the test for ignored messages sooner
      bitbake/crumbs: fix the event name determination
      bitbake/goggle: automatically show most recently added message
      bitbake/xmlrpc: Modify xmlrpc server to work with Python 2.7
      bitbake/goggle: add a ProgressBar for parse progress
      bitbake/crumbs: add optional pbar parameter to RunningBuild.handle_event()
      bitbake/depexp: Factor ProgressBar into a separate class in crumbs/
      bitbake/goggle: interaction tweaks

Kevin Tian (1):
      runqueue: use correct task ID when checking validity of setscene tasks

Khem Raj (2):
      fetch: Check for existence of tar file along with md5 signature
      fetchers: Use tar --exclude pattern to remove SCM files

Lianhao Lu (1):
      bitbake/data.py: corrected the output for shell syntax.

Mark Hatle (2):
      build.py: Add a symlink for the logging
      fetch2: Add SRPM knowledge

Nitin A Kamble (1):
      bitbake decodeurl: fix the file:// url handling

Paul Eggleton (1):
      data_smart: add optional expansion to getVarFlag()

Peter Chubb (1):
      Allow mercurial fetcher to follow tip

Richard Purdie (126):
      Add bb.utils.join_deps to handle creation of dependency strings with versions
      Gross hack to fix packaged-staging with BBCLASSEXTEND packages
      Fix handling of empty variables in local config files
      Remove two layers of unnecessary functions from task execution
      runqueue: Combine the waitpid result handling code into a function
      runqueue: Separate out task forking code into a new function
      runqueue: Remove unneeded exception catching from fork_off_task()
      runqueue: Fix number of running tasks accounting (include failed tasks)
      runqueue: Make child process error scary so user is less likely to ignore
      runqueue: Allow taskname to be passed to check_stamp_task()
      runqueue: Allow passing of success/failure handlers to runqueue_process_waitpid()
      cache: If one virtual of a recipe is uncached, remove all versions from the cache
      fetch: Only mark srcrev recipes as uncached when outside of SRCREV caching mode
      Add support for .bbappend files (see mailing lists for detais)
      cooker.py: Fix case of -b option with a full filepath
      bitbake/runqueue.py: Drop duplicated class
      bitbake/cooker.py: Allow idle handlers to pass through a true value
      bitbake/server: Raise a shutdown event if we're seeing exceptions
      bitbake/build.py: Set the current taskname in the BB_CURRENTTASK variable
      bitbake/build.py: Note when calling functions that don't exist. Should probably error
      bitbake/build.py: Set BB_FILENAME to represent the .bb file being built (including any virtual prefix)
      bitbake/utils.py: Allow explode_dep_versions to handle the commas join_deps can introduce into strings
      bitbake/utils.py: Give useful debug information when no lineno information is available
      bitbake/utils.py: Improve better_exec debug output
      utils.py: Fix bb.copyfile to change the permissions of the file back correctly
      bitbake/data_smart: Fix append/prepend/override ordering issue
      bitbake/data_smart: Refactor _append/_prepend code to remove duplication
      bitbake: Split Runqueue into two classes, a data processor and the execution part
      bitbake/runqueue.py: Create RunQueueExecute and RunQueueExecuteTasks classes, further splitting up runqueue
      bitbake/runqueue.py: Factor task skipping code into a function
      bitbake/utils.py: Ensure the last lines of functions are printed in tracebacks
      bitbake/utils.py: Improve traceback to be more helpful/clear to users
      bitbake/utils.py: Improve traceback to be more helpful/clear to users
      bitbake/utils.py: Ensure the last lines of functions are printed in tracebacks
      utils: Allow copyfile to copy files which aren't readable
      build: Add support for pre and postfuncs for tasks
      bitbake/runqueue.py: Ensure rqexe always exists and that empty task lists cause a graceful exit
      fetch: Fix named SRCREVS variable name ordering
      fetch: Ensure SRCREV is still set correctly if the pn-X override has been expanded
      runqueue: implement scenequeue
      codeparser: add module for parsing shell/python
      data_smart: track variable references
      codeparser: Implement persistent cache
      data: Add emit_func and generate_dependencies
      Implement task signatures
      runqueue: avoid unnecessary delays
      runqueue: pass task hash information to tasks
      runqueue: implement cache checking from metadata
      Add support for 'noexec' tasks
      runqueue: clean up message log levels
      Overhaul environment handling
      parse: save python functions into the metadata
      bitbake/server: Raise a shutdown event if we're seeing exceptions
      bitbake/build.py: Ditch the extract_stamp function as its just going to complicate improving the stamp handling functions
      bitbake build.py: Use localdata for stamp handling, not d
      bitbake build.py: Stamp handling improvements
      bitbake/build.py: Fix del_stamp work correctly after recent stamp function changes
      bitbake/msg.py: Add named definitions for all logging levels
      bitbake/__init__.py: Add taskpid to all LogRecords (subclassed to be BBLogRecords)
      bitbake/knotty.py: Don't show log messages of NOTE and below for task processes
      bitbake build/siggen/runqueue: Fix stampfile parameters
      bitbake/siggen.py: Add a signature generator which adds the hash to the stamp files
      fetch/__init__.py: Add missing debug level argument
      runqueue.py: Fix up some lost range->xrange conversions misplaced as part of the poky sync up
      runqueue.py: Add missing result return value in setscene failure path
      runqueue.py: Add debug to help resolve partial log message failure
      runqueue.py: Fix undefined schedulers variable reference
      bitbake/runqueue.py: Fix a bug where do_setscene dependencies would be ignored
      persist_data: Don't loop forever waiting on database locks
      event.py: Improve debug about invalid events
      utils.py: Update log message to use the logger calls
      fetch2/git: Remove duplicated code only added for backwards compatibility
      Switch to fetch2 fetcher code based on the environment variable BBFETCH2
      bitbake/runqueue.py: Fix del_stamp calls and -f option to bitbake with the BasicHash siggen code
      runqueue.py: Call bb.cache.Cache.loadDataFull function directly when dumping signatures as per the rest of runqueue
      bitbake/knotty.py: Ensure task note messages are only surpressed at default log levels
      bitbake/runqueue.py: Avoid starvation of events to the server
      __init__.py: Fix debug log level handling to correct debug output
      bitbake/msg: Ensure lower level debug messages have DEBUG prefix and reuse log level values from formatter
      bitbake/fetch2: Ensure the local revision counter takes a default value of 0, not None
      bitbake/fetch2/git: Add nocheckout option to disable checkouts and always add scm data to checkouts
      bitbake/fetch2/git: Ensure target directory exists when copying files
      bitbake/fetch2: Add missing parameter to localcount_internal_helper
      bitbake/lib/bb/fetch2: Assign a default name in the names array as empty strings as names cause problems for python
      bitbake/fetch2: When encoding a file:// url, drop user and host information
      bitbake/fetch2: Ensure that mirror fetches are symlinked from the download directory
      bitbake/fetch2: Remove old local file acceleration code
      bitbake/fetch2/git: Ensure deleted branches upstream are removed, all branch tags are forced to the upstream revisions and all revisions and tags are always fetched
      bitbake/fetch2/git: Ensure we prune origin to remove stale branches
      bitbake/fetch2/git: Switch to completely use bare clones
      bitbake/fetch2: Drop horrible SRCREV hack which is no longer needed
      bitbake/fetch2: Move ud.localfile setup into urldata_init
      bitbake/fetch2: Define a sane localpath function and remove code duplication
      bitbake/fetch2: Simplify localpath variable handling FetchData init
      bitbake/fetch2: Simplfy setup_srcrevs
      bitbake/fetch2: Drop unused parameter for localpath() and update comments
      bitbake/fetch2: Have all fetcher exceptions derived from a common BBFetchException class
      bitbake/fetch2: Rewrite and improve exception handling, reusing core functions for common operations where possible
      bitbake/fetch2: Drop old md5 handling code
      bitbake/fetch2: Rename Fetch class to FetchMethod
      bitbake/fetch2: Make srcrev_internal_helper a normal function, doesn't belong in the FetchMethod class
      bitbake/fetch2: Move getSRCDate to FetchData class where is more appropriate
      bitbake/fetch2: Drop legacy CVSDATE support
      bitbake/fetch2: Fix typo
      bitbake/fetch2: Define a new interface to the fetcher code though the 'Fetch' class
      bitbake/fetch2/svn: The concept of using dates with svn is totally insane, drop support
      bitbake/fetch2: Drop name/override ordering backwards compatibility code
      bitbake/fetch2: Use True instead of integer values
      bitbake/fetch2/git: Fix localpath to point at the clone repo since we no longer always generate a mirror tarball and it isn't a good guide to fetcher success
      bitbake/fetch2/git.py: Ensure that forcefetch operates in the correct directory for calling _contains_ref()
      bitbake/fetch2/git: use clonedir as ud.localfile too since the mirror tarball may not exist
      bitbake/fetch2: Match Fetcher log domain to that in bb.msg
      bitbake/fetch2: Update forcefetch and mirror handling to clean up, simplfy and bug fix the code
      bitbake/fetch2: Update mirror processing to ensure we look for mirror tarballs
      bitbake/fetch2: Fix pickling issues with fetcher exceptions
      bitbake/fetch2:Fetch Make using the fn based cache optional
      bitbake/fetch2/git: Ensure unresolved branches are translated into revisions
      bitbake/fetch2/git: Fix broken variable reference
      bitbake/fetch2: Ensure original ud is preserved in try_mirror
      bitbake/fetch2: Ensure we only remove files, not directories when fetch failures occur
      bitbake/fetch2: When using BB_FETCH_PREMIRRORONLY, set BB_NO_NETWORK after premirrors as there could be data processing needed by the real fetcher
      bitbake/fetch2: Move symlink handling into try_mirror where is belongs instead of the main download function
      bitbake/fetch2: Ignore UnboundLocalError in exception handler in try_mirror
      bitbake/fetch2: Fix negated if check for BB_FETCH_PREMIRRORONLY
      bitbake/fetch2/git: Write mirror tarballs if enabled and they don't exist, also set a default value for mirror tarball generation
      Release 1.12.0

Robert P. J. Day (2):
      Fix a couple typos in setup.py.
      Fix a couple typos in the CVS Fetcher section.

Ryan Phillips (1):
      Change wget fetcher to use the runfetchcmd

Saul Wold (5):
      bitbake/utils.py: add glob name matching to remove
      fetch2/git.py: Fix problem when fetching with no origin
      fetch2: add runfetchcmd to import for fetchers
      fetch2: add try/finally to ensure lockfile is unlocked on failure
      fetch2: Correct the clean() mechanism for the fetcher2 code

Yu Ke (23):
      fetch: add SRC_URI checksum
      bb.utils: check if lock file is writable, to fix Yocto bug 606
      bitbake: copy bb.fetch to bb.fetch2 as initial code base for fetcher overhaul
      bb.fetch2: replace bb.fetch with bb.fetch2 in the bb.fetch
      BBHandler: remove bb.fetch referrence
      bb.fetch2: add urldata_init call for Fetch class
      bb.fetch2.git.py: add git urldata_init
      bb.fetch2.svn.py: add urldata_init
      bb.fetch2.hg: add hg urldata_init
      bb.fetch2.bzr: add bzr urldata_init
      Fetcher: break the "SRCREVINACTION" deadlock
      Fetcher: only set __BB_DONT_CACHE when SRCREV = "${AUTOREV}"
      bb.fetch2: add unpack method in fetcher
      bb.fetch2: revise the Fetch.unpack API
      bb.fetch: add fetch version to distinguish bb.fetch and bb.fetch2
      bb.fetch2: rename "go" with "download" to better reflect its functionality
      git.py: split download to download() and build_mirror_data()
      bb.fetch2: remove the obsolate Fetch.try_mirrors referrence
      bb.fetch2: add "BB_NO_NETWORK" option
      bitbake/fetch2: Instrument fetchers when making network access
      bb.fetch2: Add git unpack
      git.py: Remove the source tree tarball archives
      fetch2: Allow multiple src rev to be used in one src_uri





